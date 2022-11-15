# read - r
# write - w if file exists it will overwrite
# append - a if file exists it will make change

# w+ read and write
# r+ read and write
# a+ read and write(append)

# absolute vs relative file
# with open('Users/mikuabe/new_folder/302_new.txt', 'w') as f:
#     f.write('hello new world')
#
# with open('./Exercise/302_new.txt', 'w') as f:
#     print(f.read())

records = []
dic = {}
with open('../Lab7/data.txt', 'r') as f:
    # d1 = f.read() # str
    # d2 = f.readline()
    # d3 = f.readlines()
    for line in f:
        d = line.split()
        f_name = d[0]
        l_name = d[1]
        email = d[2]
        password = d[3]
        key = d[0] + ' ' + d[1]

        print(d)
        records.append(d)
        print(records)
        break
        # print(line)

# why print(f.readline()) doesn't work
# print(d3)
# print(type(d3))

d = {'k1': 1, 'k2': 2, 'k3': 3}

removed_value = d.pop('k1')
print(d)
# {'k2': 2, 'k3': 3}

print(removed_value)

