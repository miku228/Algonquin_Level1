c_apple = 1  # Apples $1ea
c_eggs = 0.25  # Eggs $0.25ea
c_bread = 2.50  # Bread $$2.50ea
c_meat = 10  # Meat $10/lbs
c_orangeJuice = 2  # Orange Juice $2/litre
tax = 0.13  # Tax 13%

# Taking a quantity input from the user
q_apple = int(input("Enter a quantity of apple : "))  # apple
q_eggs = int(input("Enter a quantity of eggs : "))  # egg
q_bread = int(input("Enter a quantity of bread : "))  # bread
q_meat = float(input("Enter a quantity of meat(lbs) : "))  # meat
q_orangeJuice = float(input("Enter a quantity of orange juice(litre) : "))  # orange juice

# Calculating total cost including tax(13%)
apple_total_cost = c_apple * q_apple  # apple
eggs_total_cost = c_eggs * q_eggs  # egg
bread_total_cost = c_bread * q_bread  # bread
meat_total_cost = c_meat * q_meat  # meat
orangeJuice_total_cost = c_orangeJuice * q_orangeJuice  # orange juice

cost_after_tax = (apple_total_cost
                  + eggs_total_cost
                  + bread_total_cost
                  + meat_total_cost
                  + orangeJuice_total_cost) * (1 + tax)

print(cost_after_tax)
