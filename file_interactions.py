from datetime import datetime, date
from zipfile import ZipFile
from csv import DictReader
import requests
import os


class FileInteractions:
    def __init__(self, zip_path, folder_path, url):
        self.zip_path = zip_path
        self.folder_path = folder_path
        self.url = url

    def download_url(self, chunk_size=128):
        r = requests.get(self.url, stream=True)
        if not os.path.exists(self.folder_path):
            os.makedirs(self.folder_path)
        with open(self.zip_path, 'wb') as fd:
            for chunk in r.iter_content(chunk_size=chunk_size):
                fd.write(chunk)

    def extract_csv(self):
        file_name = ''
        with ZipFile(self.zip_path, 'r') as myzip:
            file_name = myzip.namelist()[0]
            myzip.extractall(self.folder_path)
        os.remove(self.zip_path)
        return file_name

    def get_csv_date(self, file_name):
        date_vals = file_name[:6]
        return datetime.strptime(date_vals, '%y%m%d').date()

    def get_indicators(self, cities, file_name):
        file_date = self.get_csv_date(file_name)
        change_format = date(2020,10,7)
        with open(f'{self.folder_path}/{file_name}', 'r', encoding="ISO-8859-1") as csv_f:
            f = DictReader(csv_f)
            for row in f:
                city_index = (int(row['MUNICIPIO_RES']), int(row['ENTIDAD_RES']))
                if city_index in cities:
                    confirmed_state = self.confirmed(row, file_date, change_format)
                    if confirmed_state:
                        cities[city_index]['confirmed'] += 1
                        if row['FECHA_DEF'] != '9999-99-99':
                            cities[city_index]['deaths'] += 1
        return cities

    def confirmed(self, row, file_date, change_format):
        if file_date < change_format:
            if int(row['RESULTADO']) == 1:
                return True
        else:
            if int(row['CLASIFICACION_FINAL']) in (1,2,3):
                return True
        return False