import os
import psycopg2
import psycopg2.extras
from database_common import connection_handler


@connection_handler
def execute_script_file(cursor, file_path):
    """
    Execute script file based on the given file path.
    Print the result of the execution to console.

    Example:
    > execute_script_file('db_schema/01_create_schema.sql')

    :file_path: Relative path of the file to be executed.
    """
    package_directory = os.path.dirname(os.path.abspath(__file__))
    full_path = os.path.join(package_directory, file_path)
    with open(full_path) as script_file:
        try:
            sql_to_run = script_file.read()
            cursor.execute(sql_to_run)
            print("{} script executed successfully.".format(file_path))
        except Exception as ex:
            print("Execution of {} failed".format(file_path))
            print(ex.args)


@connection_handler
def execute_select(cursor, statement, variables=None):
    """
    Execute SELECT statement optionally parameterized

    Example:
    > execute_select('SELECT %(title)s; FROM shows', variables={'title': 'Codecool'})

    :statement: SELECT statement

    :variables:  optional parameter dict"""
    result_set = []
    cursor.execute(statement, variables)
    result_set = cursor.fetchall()
    return result_set


@connection_handler
def execute_dml_statement(cursor, statement, variables=None):
    """
    Execute data manipulation query statement (optionally parameterized)

    :statment: SQL statement

    :variables:  optional parameter dict"""
    result = None
    cursor.execute(statement, variables)
    try:
        result = cursor.fetchone()
    except psycopg2.ProgrammingError as pe:
        pass
    return result
