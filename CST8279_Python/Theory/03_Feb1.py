# For Lab4 2022/02/03

# modules are the package of functions
# it makes programming faster
# use it "import module-name"
# always comes top of any code
import math
import random

# random.randrange ??

random_number = random.randint(1, 100)
print("random.randint : ", random_number)


# how to define function
def get_area_circle_v1():
    r = int(input("Please enter a radius >"))
    area = math.pi * r ** 2
    print(area)
    return None


# instead of printing return the area
# write the function like this in Lab4
# do verification outside of function

def get_area_circle_v2(r):
    area = math.pi * r ** 2
    return area


area_circle = get_area_circle_v2(6)
print("get_area_circle_v2 : ", area_circle)


# takes multiple parameters and returns multipke values
def calculate_sum_product(a, b, c, d):
    s = a + b + c + d
    p = a * b * c * d
    # return both values to the caller of the function
    return s, p


sum, product = calculate_sum_product(1, 2, 3, 4)
print(sum, product)
