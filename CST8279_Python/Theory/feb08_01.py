import math


# takes 1 arguments(parameters) and returns a value
def get_area_circle_v1(r):
    area = math.pi * r ** 2
    return area


# takes multiple arguments(parameters) and returns multiple values
def calculate_sum_product(a, b, c, d):
    s = a + b + c + d
    p = a * b * c * d
    return s, p


some_char = "h"
t = type(some_char)
print(t)
