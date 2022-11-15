import math    # import math module
import random  # import random module
import string  # import string module(use for generate_password func)


# functions
# 1 : return the volume of cone : πr^2h/3
def get_cone_volume(radius, height):
    volume = math.pi * radius ** 2 * height / 3
    # need to round up 2 decimals
    return round(volume, 2)


# 2 : return a password string
def generate_password(length):
    # insert chars to this variable
    passwd = ""
    # list of lowercase, uppercase, digit, punctuation
    chars = string.ascii_lowercase + string.ascii_uppercase + string.digits + string.punctuation
    for i in range(length):
        passwd += random.choice(chars)
    return passwd


# 3 : return counts(int) of vowels in string
def count_vowels(word):
    # make string lower case to check with vowels list
    lower_string = word.lower()
    # numbers of vowels in the string
    counts = 0
    # vowels list
    vowels = ["a", "e", "i", "o", "u"]
    # check the lower_string(arg) one by one
    for char in lower_string:
        # check the lower_string(arg) and vowels one by one
        for vowel in vowels:
            # when char == vowel(lower_string is in vowels list), then counts +1
            if char == vowel:
                counts += 1
    return counts


# 4 : ask the user if they want to start again
def repeat():
    rep_flag = input("Do you want to try again(y/n)?")
    if rep_flag == "y":
        return 1
    else:
        print("Bye")
        exit(0)
        # return 0


# Main
# 4 4option to the user
while True:
    try:
        # cascade to int type
        print("-----------------------------------------------------------------\n\
        Option 1: calculate cone volume.\n\
        Option 2: test generate password.\n\
        Option 3: test count vowels.\n\
        Option 4: Exit.\n -----------------------------------------------------------------")
        option = int(input("Please input option number 1 to 4 to execute functions >"))

        if option == 1:
            # Op1 : execute the get_cone_volume func
            # catch valueError
            try:
                # ask user to input radius and height(float)
                cv_r = float(input("Input radius to calculate the volume of cone > "))
                cv_h = float(input("Input height to calculate the volume of cone > "))
                # calculate cone volume, pass user input as radius and height
                cone_volume = get_cone_volume(cv_r, cv_h)
                print("Cone volume : ", cone_volume)
                repeat()  # ask user to repeat from beginning or not

            except ValueError:
                # catch the error of radius and height input
                print("This is not a float or a integer.")
                repeat()  # ask user to repeat from beginning or not

        elif option == 2:
            # Op2 : test the generate_password func
            # catch ValueError
            try:
                pass_length = int(input("input the length of password(Integer) > "))
                password = generate_password(pass_length)  # execute the generate_password func
                print("Your password : ", password)  # print the result
                repeat()  # ask user to repeat from beginning or not

            except ValueError:
                # catch the error of length input
                print("This is not a Integer.")
                repeat()  # ask user to repeat from beginning or not

        elif option == 3:
            # Op3 : test the count_vowels func
            # user input is always string, no need to cascade, no ValueError
            user_word = input("Please input the a word (String)>")
            c_vowels = count_vowels(user_word)
            print("Your input string : ", user_word)
            print("Number of vowels in the word : ", c_vowels)
            repeat()  # ask user to repeat from beginning or not

        elif option == 4:
            # Op4 : to Exit
            print("Bye")
            exit(0)

        # option except 1 to 4
        else:
            print("Please input integer 1 to 4")
            repeat()

    except ValueError:
        # try to catch Line57 Error(option input)
        print("Please input integer 1 to 4")
        repeat()
