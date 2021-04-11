from file_interactions import FileInteractions

def main():
    file_interact = FileInteractions('zip/file.zip', 'zip')
    # # Specific 2020 day
    # url = 'http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/historicos/04/datos_abiertos_covid19_12.04.2020.zip'
    # # Specific 2021 day
    # url = 'http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/historicos/2021/04/datos_abiertos_covid19_09.04.2021.zip'
    # Last day
    url = 'http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip'
    file_interact.download_url(url)
    file_interact.extract_csv()
    year, month, day = file_interact.get_csv_date()
    print(year, month, day)


if __name__ == '__main__':
    main()
