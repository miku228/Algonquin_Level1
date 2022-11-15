import feb08_01


# function
def check_if_integer(val):
    try:
        int(val)
        return True
    except ValueError:
        return False


# user_input = input("Please input a number > ")
# result = check_if_integer(user_input)
# print(result)

# result_1 = feb08_01.calculate_sum_product(1, 2, 3, 4)
# print(result_1)


# def validate_type(val, val_type):
#     try:
#         val_type(val)
#         return True
#     except ValueError:
#         return False
#
#
# result_2 = validate_type("some string", str)
# print(result_2)

# first parameter : start count, second : end before that, third : how much count up/down
for count in range(200, 120, -20):
    print(count)
