from models import Upload, City, State, DbInteraction
from sqlalchemy.orm import sessionmaker
from json import load
import pandas as pd


def populate_upload(ses):
    dates = pd.date_range(start="2020-04-12",
                          end="2022-04-12").to_pydatetime().tolist()
    ses.add_all([Upload(up_date=x.date()) for x in dates])


def populate_states(ses):
    with open('data/states.json', 'r') as f:
        data = load(f)

    db_states = []
    for s in data['mx_states']:
        db_states.append(State(state_name=s[0], abbreviation=s[1],
                               latitude=s[2], longitude=s[3]))
    ses.add_all(db_states)


def populate_cities(ses):
    with open('data/cities.json', 'r') as f:
        data = load(f)

    db_cities = []
    for c in data['mx_cities']:
        db_cities.append(City(state_id=c[0], city_name=c[1],
                              latitude=c[2], longitude=c[3]))
    ses.add_all(db_cities)


def main():
    db = DbInteraction('ODBC Driver 17 for SQL Server', 'localhost,1433',
                       'mex_covid_py', 'sa', 'this_isAstrong!password')

    Session = sessionmaker(bind=db.engine)
    ses = Session()
    # populate_upload(ses)
    # populate_states(ses)
    # populate_cities(ses)
    ses.commit()


if __name__ == '__main__':
    main()
