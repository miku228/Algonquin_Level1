# ---------------
#  Week 1 Review
# ---------------
# DataTypes : string, int , float, boolean
name = "Miku Abe"
# = means assign operator
name = "John Doe"  # you can reassign it

# int
result = 3
floating_point = 4.32
float_times_int = floating_point * result

print("float(result) : ", float(result))
print("int(floating_point) : ", int(floating_point))
print(float_times_int)
print(int(float_times_int))  # it drops after decimal

# +, -, *, /, %, //
print(5.0//2)  # it drops after decimal
print(5/2)

# ---------------
#  Week 2 Review
# ---------------
# Conditions
# if, elif, else

# Operators : ==, >=, <=, !, and, or, not
# Boolean : Depends on the operator and operand
print(5 > 2)   # True
print(5 < 2)   # False
print(5 == 2)  # False
print(5 != 2)  # True
# print(bool(1))
# user_input = input("Please enter a choice >")
#
# if user_input == "1":
#     print(5+2)
# elif user_input == "2":
#     print(5*2)
# else:
#     print(5/2)

# for loops : if you know how many times you're gonna do
# for x in range(5):
#     user_input = input("Enter a number > ")
#     print(user_input)

name = "MikuAbe"
print(len(name))
for i in range(len(name)):
    print(i)

for char in name:
    print(char)

