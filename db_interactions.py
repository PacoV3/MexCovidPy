from sqlalchemy import Column, Integer, Date
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine
import pandas as pd

Base = declarative_base()

class DbInteraction:
    def __init__(self, driver, server, database, user, password):
        self.engine = create_engine(f"mssql+pyodbc://{user}:{password}@{server}/{database}?driver={driver}")

class UpdateDates(Base):
    __tablename__ = "UpdateDates"
    Id = Column(Integer, primary_key=True)
    UpdateDate = Column(Date)

def main():
    from sqlalchemy import inspect
    from datetime import date, datetime

    db = DbInteraction('ODBC Driver 17 for SQL Server', 'localhost,1433',
        'mex_covid_py', 'sa', 'this_isAstrong!password')

    Base.metadata.bind = db.engine    
    Base.metadata.drop_all()
    Base.metadata.create_all()

    Session = sessionmaker(bind=db.engine)
    ses = Session()
    dates = pd.date_range(start="2020-04-12",end="2022-04-12").to_pydatetime().tolist()
    ses.add_all([UpdateDates(UpdateDate = x.date()) for x in dates])
    ses.commit()

    rs = ses.query(UpdateDates).all()

    # for u_date in rs:
    #     print(u_date.UpdateDate)

if __name__ == '__main__':
    main()
