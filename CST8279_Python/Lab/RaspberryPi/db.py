import mysql.connector #pip3 install mysql-connector-python
from configparser import ConfigParser


def readDBConfig(filename='config.ini', section='mysql'):
    db = {}

    parser = ConfigParser()
    parser.read(filename)

    if parser.has_section(section):
        items = parser.items(section)
        for item in items:
            db[item[0]] = item [1]
    else:
        print('Error with config.ini file')
    return db


# pull all the records from the city table in the worlds_x database
def display_cities():
    creds = readDBConfig()
    conn = mysql.connector.MySQLConnection(**creds)
    cursor = conn.cursor()
    cursor.execute("select * from city")
    rows = cursor.fetchall()

    for row in rows:
        print(row)

    cursor.close()
    conn.close()


display_cities()
# print(readDBConfig())
