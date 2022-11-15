while True:
    try:
        # trys to run the code in the try block
        user_input = int(input("please enter an integer : "))
        break
    except ValueError:
        # executes only if catch the error in the try block
        print("This is not integer")

print(user_input * 5)
