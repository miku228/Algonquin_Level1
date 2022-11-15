import read_db_conf
import mysql.connector
import csv


print('------ db_to_csv starts ------')
# connect to the database
creds = read_db_conf.readDBConfig()
conn = mysql.connector.MySQLConnection(**creds)
cursor = conn.cursor()

# get rows from employees table
cursor.execute("SELECT * FROM employees")
rows = cursor.fetchall()

# write rows to a csv file
with open('employees_db.csv', 'w', newline='') as csvfile:
    c_writer = csv.writer(csvfile, quoting=csv.QUOTE_ALL, delimiter=',')
    c_writer.writerows(rows)

# close cursor and connector
cursor.close()
conn.close()

