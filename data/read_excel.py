from time import sleep
from os import getenv
import requests
import json
import csv


def get_coords(county, state):
    email = getenv('COORDS_API_EMAIL')
    api_url = f'https://nominatim.openstreetmap.org/search/{county},{state},MX?format=json&addressdetails=1&limit=1&email={email}'
    response = requests.get(api_url)
    if response.status_code == 200:
        json_response = json.loads(response.content.decode('utf-8'))
        if json_response:
            lat = float(json_response[0]['lat'])
            lon = float(json_response[0]['lon'])
            return [lat, lon]
    return None


def get_states():
    result = {}
    with open('entidades.csv', newline='', encoding="utf8") as csv_states:
        states = csv.reader(csv_states, delimiter=',')
        next(states)
        for id, name, _ in states:
            if id not in ['36', '97', '98', '99']:
                result[id] = name
    return result


def make_queries(states):
    with open('municipios.csv', newline='', encoding="utf8") as muni_csvfile:
        municipios = csv.reader(muni_csvfile, delimiter=',')
        next(municipios)
        for municipio in municipios:
            if municipio[0] not in ['997', '998', '999']:
                coords = get_coords(municipio[1], states[municipio[2]])
                if coords != None:
                    query = f"INSERT INTO Cities VALUES({municipio[0]}, {municipio[2]}, '{municipio[1]}', {coords[0]}, {coords[1]})"
                    with open("last_index.txt", "a") as last_index:
                        last_index.write(f'{municipio[0],municipio[2]}\n')
                else:
                    query = f"INSERT INTO Cities VALUES({municipio[0]}, {municipio[2]}, '{municipio[1]}', NULL, NULL)"
                print(query)
                with open("queries.txt", "a", encoding="utf-8") as queries:
                    queries.write(f'{query}\n')
                sleep(2)


def main():
    states = get_states()
    print(states)
    make_queries(states)


if __name__ == '__main__':
    main()
