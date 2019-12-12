import datetime
import os
import sys

from psycopg2 import DataError

import init_db
from data_manager import execute_select, execute_dml_statement


def main():
    init_db.init_db()
    print("database created!!")


if __name__ == '__main__':
    main()