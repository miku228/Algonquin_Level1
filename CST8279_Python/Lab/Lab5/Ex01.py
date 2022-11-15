import random


objs_list = ["r", "p", "s"]  # objects list


# function : repeat input() until user_ob in objs_list:
def verified_input():
    # set user object "" every time
    user_ob = ""
    # loop for getting validate input
    while user_ob not in objs_list:
        user_ob = input("Please input R(rock) or P(paper) or S(scissors) >")
    return user_ob.lower()  # format to lowercase


# function : increase point and return it
def points(who, user_p, comp_p):
    if who == "user":
        user_p += 1
        print("You win (/^▽^)/ \nYour Point : ", user_p)
        return user_p, comp_p
    else:
        comp_p += 1
        print("You lose（ｉДｉ）\nYour Point : ", user_p)
        return user_p, comp_p


# function : check user object and computer object then decide a winner and give a point
def check_winner(user_o, comp_o, user_p, comp_p):
    if user_o == comp_o:
        print("A draw")
        return user_p, comp_p

    # user wins pattern
    elif (user_o == "r" and comp_o == "s") \
            or (user_o == "p" and comp_o == "r") \
            or (user_o == "s" and comp_o == "p"):
        user_p, comp_p = points("user", user_p, comp_p)  # return user_p, comp_p after math done
        return user_p, comp_p

    # computer wins pattern
    elif (user_o == "r" and comp_o == "p") \
            or (user_o == "p" and comp_o == "s") \
            or (user_o == "s" and comp_o == "r"):
        user_p, comp_p = points("comp", user_p, comp_p)  # return user_p, comp_p after math done
        return user_p, comp_p


# Main
while True:
    # initialize user and computer point
    round_num = 0
    user_point = 0
    comp_point = 0
    # loop until three rounds round_num:0->2(3times)
    while round_num < 3:
        # set validated user input
        user_obj = verified_input()

        # set the computer object everytime
        comp_obj = random.choice(objs_list)
        # count up the round
        round_num += 1
        # print the conditions
        print("Round : ", round_num)

        # get two parameter(user and computer point) as return
        user_point, comp_point = check_winner(user_obj, comp_obj, user_point, comp_point)
        # while ends here

    if user_point > comp_point:
        print("*** Winner *** : You\n")
    elif user_point < comp_point:
        print("*** Winner *** : Computer\n")
    else:
        print("*** A Draw ***\n")

    # asking user about try again or not
    answer = input("Do you want to play again(y/n)? > ")
    if answer != "y":
        print("Bye")
        break

