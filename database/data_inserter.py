import datetime
import os
import sys

from psycopg2 import DataError

import init_db
from data_manager import execute_select, execute_dml_statement, execute_script_file


def main():
    init_db.init_db()
    init_db.create_schema()
    execute_script_file("db_schema/fill_db.sql")
    print("YOLO")


if __name__ == '__main__':
    main()