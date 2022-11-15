# list of strings
fruits = []
cars = ["Honda", "Toyota", "Kia", "Mazda"]
# cars.append("Acura")
#
# for car in cars:
#     car = car + "1"
#
# print(cars)
#
#
# for i in range(len(cars)):
#     cars[i] = cars[i]*5
#
# print(cars)

for index, item in enumerate(cars):
    cars[index] = item * 5
print(cars)
