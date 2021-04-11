import pyodbc
import pandas as pd

class DbInteraction:
    def __init__(self, driver, server, database, user, password):
        self.conn = pyodbc.connect(
            f'Driver={driver};'
            f'Server={server};'
            f'Database={database};'
            f'UID={user};'
            f'PWD={password};')

    def get_update_id(self, date_val):
        df = pd.read_sql(f"SELECT TOP 1 UpdateDateId FROM UpdateDates WHERE DateUpdate = '{date_val}'", self.conn)
        result = -1 if df.empty else df['UpdateDateId'][0]
        return result

def main():
    from datetime import date
    db = DbInteraction('{ODBC Driver 17 for SQL Server}', 'localhost,1433', 'MexCovidPy', 'sa', 'this_isAstrong!password')

    date_val = date(2020, 4, 11)
    data = db.get_update_id(date_val)
    print(data)

    date_val = date(2020, 4, 12)
    data = db.get_update_id(date_val)
    print(data)

if __name__ == '__main__':
    main()
