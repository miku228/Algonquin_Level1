# Fahrenheit　(32°F - 32) × 5 ÷ 9 = 0°C
# Celsius

# expect user input will be float number
fahrenheit = float(input("Enter the Fahrenheit : "))

celsius = ((fahrenheit - 32.00) * 5.00)/9.00

# To display upto 2 decimal places, format the celsius
# print(format(celsius, '.2f'))
print(round(celsius, 2))

