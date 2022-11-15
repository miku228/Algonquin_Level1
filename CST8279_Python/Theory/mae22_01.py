import pprint

eng2sp = dict()
eng2sp = {'one': 'uno', 'two': 'dos', 'three': 'tres'}
# print(eng2sp)


def print_hist(h):
    for c in h:
        print(c, h[c])


def reverse_lookup(d, v):
    results = []
    for k in d:
        if d[k] == v:
            results.append(k)
    return results


def invert_dict(d):
    inverse = dict()
    for key in d:
        val = d[key]
        if val not in inverse:
            inverse[val] = [key]
        else:
            inverse[val].append(key)
    return inverse


def histogram(s):
    d = dict()
    for c in s:
        if c not in d:
            d[c] = 1
        else:
            d[c] += 1
    return d


hist = histogram('parrot')
# print(hist)
# print(invert_dict(hist))

# declared a new empty dic
country_dict = {'Canada': ['Toronto', 'Ottawa'], 'USA': ['Miami', 'Kanzas city']}

country_dict['Russia'] = ['Moscow', 'Kazan']

# print(country_dict)
# print(len(country_dict))


for key in country_dict:
    cities = ''
    for value in country_dict[key]:
        cities += " " + value
    # print(key, '-', cities)

#
# output = ''
# for key in country_dict:
#     cities = country_dict[key]
#     output += 'n' + key + ' '
#     for value in country_dict[key]:
#         output += value + ' '
# print(output)
# Canada - Toronto Ottawa
# USA - Miami, Kansas city
# Russia - Mosscow

# pprint.PrettyPrinter(indent=1)
nested_list = [[1,2], [3,4], [5,6]]
nested_dict = {
    'employee_1': {
        'name': 'John Smith',
        'email': 'john@comp.com'
    }
}
print(nested_dict['employee_1']['email'])
# pprint.pprint(nested_dict)

employee_1 = {'name': 'John Smith', 'email': 'john@comp.com'}
employee_2 = {'name': 'Sarah Smith', 'email': 'sarah@comp.com'}
employee_3 = {'name': 'Elon Smith', 'email': 'elon@comp.com'}

employee_dict = {'record_1': employee_1}
employee_dict['record_2'] = employee_2
employee_dict['record_3'] = employee_3
# print('original: ', employee_dict)

# change employee_3 email to 'musk@gmail.com'
employee_dict['record_3']['email'] = 'musk@gmail.com'
# print('changed: ', employee_dict)

d_list = {
    'value0': ['key0', 'key1'],
    'key2': ['value2']
}

# list_d = [{}, {}, {}]

d = {
    1: [{'a': 'apple'}, {'b': 'brick'}],
    2: [{'c': 'cat'}, {'d': 'dog'}],
     }

print(d[2][0])
