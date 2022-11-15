# 3 ERRORS
# Runtime Errors : compiled perfectly, when run it happens
# Name Error - when a variable is not defined
# Value Error - unable to cast to another data type
# DevisionByZero Error -can't devide by 0

# Syntax Error :
# 1var_name = "Miku" - you cannot start with number for variable name

# Semantic Error :
#


# in this case we don't know how many times we should repeat it
while True:
    try:
        user_input = input("Please enter a number >")
        user_input = int(user_input)
        break
    except ValueError:
        print("This is not a number. Please try again")
