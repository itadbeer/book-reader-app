from psycopg2 import *
from config import *

connection = None
cursor = None

def do_connect():
    global connection, cursor
    try:
        # Connect to an existing database
        connection = connect(user=DB_USER,
                             password=DB_PASSWORD,
                             host=DB_HOST,
                             port=DB_PORT,
                             database=DB_NAME)
        connection.set_session(autocommit=True)
        # Create a cursor to perform database operations
        cursor = connection.cursor()
    except (Exception, Error) as error:
        print("Error while connecting to PostgreSQL", error)


def disconnect():
    if connection:
        cursor.close()
        connection.close()
