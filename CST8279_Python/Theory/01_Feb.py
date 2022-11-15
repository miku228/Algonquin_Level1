# Handling ValueError
name_error = "Hello World"

try:
    # trys to run the code in the try block
    user_input = int(input("please enter an integer : "))
    print(name_error)

except ValueError:
    # executes only if catch the error in the try block
    print("This is not integer")

except NameError:
    print("Variable not defined!")

print("Have a nice day")


# semantic, syntax, runtime error

# ValueError
# NameError
# ZeroDivisionError
