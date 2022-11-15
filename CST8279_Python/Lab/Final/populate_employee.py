import pop_db
import mysql.connector
import read_db_conf

# open emplpyee_data.txt and read data one by one
with open('employee_data.txt', 'r') as f:
    # connect to the database
    creds = read_db_conf.readDBConfig()
    conn = mysql.connector.MySQLConnection(**creds)
    cursor = conn.cursor()

    lines = f.readlines()
    # read from after header line
    for line in lines[1:]:
        data = line.split('\t')
        d_id = data[0]
        fname = data[1]
        lname = data[2]
        email = data[3]
        password = data[4]
        ag_income = int(data[5])


        # calculate four tax using pop_db functions
        fed_tax = pop_db.calc_fed_tax(ag_income)
        on_tax = pop_db.calc_on_tax(ag_income)
        cpp = pop_db.calc_cpp(ag_income)
        ei = pop_db.calc_ei(ag_income)

        # net_income = gross_income - fed_tax - on_tax - cpp - ei
        net_income = ag_income - fed_tax - on_tax - cpp - ei
        print(net_income)
        # ---------------------------------------------------------------
        # insert data as a row to Payroll database employees table
        # ---------------------------------------------------------------
        query = "INSERT INTO employees(id, FName, LName, email, password, gross_income, fed_tax, on_tax, cpp, ei, net_income) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        val = (d_id, fname, lname, email, password, ag_income, fed_tax, on_tax, cpp, ei, net_income)
        cursor.execute(query, val)
        conn.commit()

        print(cursor.rowcount, "record inserted, ID:", cursor.lastrowid)

    # closing cursor and connector
    cursor.close()
    conn.close()

