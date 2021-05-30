from sqlalchemy import Column, Integer, Float, String, Date, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine

Base = declarative_base()


class DbInteraction:
    def __init__(self, driver, server, database, user, password):
        self.engine = create_engine(
            f"mssql+pyodbc://{user}:{password}@{server}/{database}?driver={driver}")


class Upload(Base):
    __tablename__ = "upload"
    id = Column(Integer, primary_key=True)
    up_date = Column(Date)


class State(Base):
    __tablename__ = "state"
    id = Column(Integer, primary_key=True)
    state_name = Column(String)
    abbreviation = Column(String)
    latitude = Column(Float)
    longitude = Column(Float)
    cities = relationship("City", back_populates="state")


class City(Base):
    __tablename__ = "city"
    id = Column(Integer, primary_key=True)
    city_name = Column(String)
    latitude = Column(Float)
    longitude = Column(Float)
    state_id = Column(Integer, ForeignKey('state.id'))
    state = relationship("State", back_populates="cities")


def main():
    db = DbInteraction('ODBC Driver 17 for SQL Server', 'localhost,1433',
                       'mex_covid_py', 'sa', 'this_isAstrong!password')

    Base.metadata.bind = db.engine
    Base.metadata.drop_all()
    Base.metadata.create_all()


if __name__ == '__main__':
    main()
