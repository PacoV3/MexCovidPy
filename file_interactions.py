from zipfile import ZipFile
import requests
import os


class FileInteractions:
    def __init__(self, zip_path, folder_path):
        self.zip_path = zip_path
        self.folder_path = folder_path


    def download_url(self, url, chunk_size=128):
        r = requests.get(url, stream=True)
        with open(self.zip_path, 'wb') as fd:
            for chunk in r.iter_content(chunk_size=chunk_size):
                fd.write(chunk)


    def extract_csv(self):
        with ZipFile(self.zip_path,'r') as myzip:
            myzip.extractall(self.folder_path)
        os.remove(self.zip_path)


    def get_csv_date(self):
        year = month = day = ''
        files = os.listdir(self.folder_path)
        if len(files) == 1:
            file_name, ext = os.path.splitext(files[0])
            if ext == '.csv' and file_name:
                year = file_name[:2]
                month = file_name[2:4]
                day = file_name[4:6]
        return year, month, day
