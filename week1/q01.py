"""1. Write a Python function celsius_to_fahrenheit(celsius) that converts temperature from Celsius to Fahrenheit using the formula: F = (C x 9/5) + 32. The function takes one parameter (celsius) and returns the Fahrenheit equivalent. Test with 0 degrees C, 25 degrees C, and 100 degrees C."""

def celsius_to_fahrenheit(celsius):
    f=(celsius *9/5)+32
    return f
print("celsius_to_fahrenheit(0) ->",celsius_to_fahrenheit(0))
print("celsius_to_fahrenheit(25) ->",celsius_to_fahrenheit(25))
print("celsius_to_fahrenheit(100) ->",celsius_to_fahrenheit(100))
