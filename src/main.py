import psycopg2
import pandas as pd
import sqlalchemy as db
from sqlalchemy import text
import os

def write_to_DB():
    
    REFERENCED = ['departments', 'employees', 'titles']  # A list of referenced tables.
    REFERENCING = ['salaries', 'dept_emp', 'dept_manager'] # A list of referencing tables.
    
    cnx = db.create_engine("postgresql+psycopg2://postgres:postgres@postgres/company")    
    conn = cnx.connect()   
    
    # Write the referenced tables data to the database.
    for table in REFERENCED:
        data = pd.read_csv(f"../data/{table}.csv")
        data.to_sql(table, con=conn, if_exists='replace', index=False)
        print(f"Written {table} data to the database.")
    
    # Write the referencing tables data to the database. 
    for table in REFERENCING:
        data = pd.read_csv(f"../data/{table}.csv")
        data.to_sql(table, con=conn, if_exists='replace', index=False)
        print(f"Written {table} data to the database.")
        
    conn.close()


def import_DB_schema():      
    cnx = psycopg2.connect(database="company", user='postgres', password='postgres', host='postgres', port='5432')    
    conn = cnx.cursor()

    conn.execute(open("../queries/create_queries.sql", 'r').read())
    print(f"Imported schema to the database.")

    conn.close()

if __name__=="__main__":
    import_DB_schema()
    write_to_DB()
