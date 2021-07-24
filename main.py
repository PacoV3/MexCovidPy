from file_interactions import FileInteractions
from sqlalchemy.orm import sessionmaker
from models import City, DbInteraction
from sqlalchemy import select

def main():
    # Specific 2020 day
    # url = 'http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/historicos/09/datos_abiertos_covid19_12.09.2020.zip'
    # Specific 2021 day
    # url = 'http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/historicos/2021/04/datos_abiertos_covid19_09.04.2021.zip'
    # Last day
    url = 'http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip'
    # file_interact = FileInteractions(folder_path='zip', url=url)
    # file_interact.download_url()
    # csv_name = file_interact.extract_csv()

    # Indicators test
    db = DbInteraction('localhost,5432', 'mex_covid_py',
                       'postgres', 'this_isAstrong#password')
    Session = sessionmaker(bind=db.engine)
    ses = Session()
    cities = {}

    file_interact = FileInteractions(folder_path='zip')
    result = ses.execute(select(City)).scalars().all()
    for city in result:
        cities[(city.city_code, city.state_id)] = {
            'confirmed': 0, 'deaths': 0, 'city_id': city.id}
    daily_indicators = file_interact.get_indicators(cities, '210721COVID19MEXICO.csv')
    for city_summary, _ in zip(daily_indicators.values(), range(5)):
        print(city_summary)


if __name__ == '__main__':
    main()
