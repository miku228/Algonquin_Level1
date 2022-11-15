import pprint
import hashlib


# check dept has multiple values or not
# return dept & emp
def dept_emp(dt, index):
    dept = ''
    emp = ''
    if len(dt) - index > 2:
        for m in range(index + 1, len(dt) - 1):
            dept += dt[m] + ' '
        emp = dt[len(dt) - 1]
    else:
        dept = dt[index + 1]
        emp = dt[index + 2]
    return dept, emp

# find email. password, ip_address and return them
def mail_pass_ip(p):
    eml = d[p]
    pswd = d[p + 1]
    ip_ad = d[p + 2]
    return eml, pswd, ip_ad

output_d = {}
# open data.txt and read data one by one
with open('data.txt', 'r') as f:
    for line in f:
        emp_d = {}
        d = line.split()
        f_name = d[0]
        l_name = ''
        department = ''
        n = 1
        # check the row has middle name or not
        if ('@' not in d[2]) and (d[2] != 'email'):
            # set to l_name until the data which include '@' comes
            while '@' not in d[n]:
                l_name += d[n] + ' '
                n += 1
            mail_pass_ip01 = mail_pass_ip(n)
            email = mail_pass_ip01[0]
            password = mail_pass_ip01[1]
            ip_address = mail_pass_ip01[2]
            dept_emp_data01 = dept_emp(d, n + 2)
            department = dept_emp_data01[0]
            employer = dept_emp_data01[1]

        elif ('@' in d[2]) or (d[2] == 'email'):
            l_name = d[1]
            mail_pass_ip01 = mail_pass_ip(2)
            email = mail_pass_ip01[0]
            password = mail_pass_ip01[1]
            ip_address = mail_pass_ip01[2]
            dept_emp_data02 = dept_emp(d, 4)
            department = dept_emp_data02[0]
            employer = dept_emp_data02[1]

        emp_d[f_name + ' ' + l_name] = {'department': department,
                                        'email': email,
                                        'ip_addr': ip_address,
                                        'password': password
                                        }

        # check the key employer exist or not
        if employer in output_d:
            output_d[employer].append(emp_d)
        else:
            output_d[employer] = [emp_d]

# delete first row
output_d.pop('employer')

pprint.PrettyPrinter(indent=1)
output_s = pprint.pformat(output_d)

with open('Testoutput.txt', 'w') as f:
    f.write(output_s)

print(hashlib.md5(open('Testoutput.txt', 'rb').read()).hexdigest())
