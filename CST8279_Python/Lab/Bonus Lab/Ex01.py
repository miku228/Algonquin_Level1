# Miku Abe
# 041047851
# CST8290 - 302

# The purpose of this lab is to interact with a mySql database on a remote server via a local python program.

#### Remote Server (Raspberry Pi)

# 1. On the Raspberry PI, create a database called Student.

# 2. Download the file Student.sql and use it to populate the database.
# 	- You can use `scp` command to copy files from your computer to raspberry pi and vice versa.

#### Host Computer (Your computer)

# 4. Install the mysql connector module in Pycharm.
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

# print(readDBConfig())

# 5. Create a function `insertGrade` that receives 4 parameters, a `lastName`, a `firstName`, a `province` and a `grade`.
# The function then connects to the database and inserts the record.


def insertGrade():
    # get data from user
    print('-------------------------')
    fname = input('Please input firstName to insert> ')
    lname = input('Please input lastName to insert > ')
    province = input('Please input province to insert > ')
    grade = input('Please input grade to insert > ')
    print('-------------------------')
    # connect to the database
    creds = readDBConfig()
    conn = mysql.connector.MySQLConnection(**creds)
    cursor = conn.cursor()
    query = "INSERT INTO Grades(FName, LName, Province, Grade) VALUES(%s, %s, %s, %s)"
    val = (fname, lname, province, grade)
    cursor.execute(query, val)
    conn.commit()

    print( cursor.rowcount, "record inserted, ID:", cursor.lastrowid)
    cursor.close()
    conn.close()

# 6. Create a function `deleteGrade` that receives 4 parameters, a `lastName`, a `firstName`, a `province` and a `grade`. The function then connects to the database and deletes that record.


def deleteGrade():
    # get data from user
    print('-------------------------')
    d_fname = input('Please input firstName to delete > ')
    d_lname = input('Please input lastName to delete > ')
    d_province = input('Please input province to delete > ')
    d_grade = input('Please input grade to delete >')
    print('-------------------------')
    # connect to the database
    creds = readDBConfig()
    conn = mysql.connector.MySQLConnection(**creds)
    cursor = conn.cursor()
    query = "DELETE FROM Grades WHERE FName =%s AND LName = %s AND Province = %s AND Grade =  %s"
    val = (d_fname, d_lname, d_province, d_grade)
    cursor.execute(query, val)
    conn.commit()

    print(cursor.rowcount, "records are deleted")
    cursor.close()
    conn.close()

# 7. Create a function `displayGrade`  that receives 3 parameters, a `lastName`, a `firstName`, a `province`. Make sure your query uses the sql LIKE function.
#    The function then connects to the database and returns a list of grades.


def displayGrade():
    # get data from user
    print('-------------------------')
    s_fname = input('Please input firstName to display grades> ')
    s_lname = input('Please input lastName to display grades> ')
    s_province = input('Please input province to display grades> ')
    print('-------------------------')
    # connect to the database
    creds = readDBConfig()
    conn = mysql.connector.MySQLConnection(**creds)
    cursor = conn.cursor()
    query = "SELECT Grade FROM Grades WHERE FName LIKE %s AND LName LIKE %s AND Province LIKE %s"
    val = ['%' + s_fname + '%', '%' + s_lname + '%', '%' + s_province + '%']
    cursor.execute(query, val)
    rows = cursor.fetchall()

    for row in rows:
        print(row)

    cursor.close()
    conn.close()

# 8. The 3 functions should make use of the function `readDbConfig`. As shown in class.

# 9. Write a python program that proposes the following options:
# - Enter a grade
insertGrade()
# - Display a grade
deleteGrade()
# - Delete a grade
displayGrade()
# - Exit

