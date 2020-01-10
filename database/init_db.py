from data_manager import execute_script_file
from database_common import connection_handler
import os


@connection_handler
def init_db(cursor):
    db_name = os.environ.get('MY_PSQL_DBNAME')
    try:
        drop_statement = 'DROP DATABASE IF EXISTS "{}";'.format(db_name)
        create_statement = 'CREATE DATABASE "{}";'.format(db_name)
        cursor.execute(drop_statement)
        cursor.execute(create_statement)
        print("Database created.")
    except Exception as ex:
        print("Database creation failed")
        print(ex.args)


def create_schema():
    file_path = 'db_schema/create_db_schema.sql'
    try:
        execute_script_file(file_path)
        print("Database schema created.")
    except Exception as ex:
        print("Schema creation failed")
        print(ex.args)
