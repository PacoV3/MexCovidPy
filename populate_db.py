from models import Upload, City, State, DailyCitySummary, DbInteraction
from sqlalchemy.orm import sessionmaker
from sqlalchemy import select
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
        db_cities.append(City(city_code=c[0], state_id=c[1], city_name=c[2],
                              latitude=c[3], longitude=c[4]))
    ses.add_all(db_cities)


def main():
    db = DbInteraction('localhost,5432', 'mex_covid_py',
                       'postgres', 'this_isAstrong#password')

    Session = sessionmaker(bind=db.engine)
    ses = Session()
    # populate_upload(ses)
    # populate_states(ses)
    # populate_cities(ses)
    # cities = {}
    # result = ses.execute(
    #     select(City.id, City.city_code, City.state_id)
    # )
    # for id, city_code, state_id in result:
    #     cities[(city_code, state_id)] = id
    # print(cities)
    # ses.commit()


if __name__ == '__main__':
    main()
