# for x in range(1, 20):
#     if x == 5:
#         continue
#     print(x)
#     if x == 10:
#         break
#
# print("Out Of Loop")

# i = 0
# while True:
#     i = i + 1
#     print("Hello World", i)
#     if i == 100:
#         break

# for a in range(0, 11, 2):
#     for b in range(10):
#         for c in range(-10, 0):
#             print(a, b, c)
# c
# a = 2
# b = 3
# c = "Hello"
# result = "Worksheet2"
# print(result[-5:-3])


# Write a program that asks the user for a umber of seconds
# and prints our how many minutes and seconds that is.
# For instance 300 seconds is 6 minutes and 20 seconds

# user_seconds = int(input("please input a number of seconds > "))
# u_min = user_seconds // 60
# u_sec = user_seconds % 60
# sec = user_seconds - (60*u_min)
#
# print(user_seconds, "seconds is ", u_min, "minutes and ", u_sec, "seconds")

sum_num = 0
for i in range(10):
    user_input = int(input("please input a number >"))
    sum_num += user_input

print("SUM : ", sum_num)
print("AVG : ", sum_num/10)
