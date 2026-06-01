"""8. Create a function calculate_bmi(weight_kg, height_m) that calculates the Body Mass Index using BMI = weight / (height squared) and returns a dictionary with 'bmi' (rounded to 2 decimals) and 'category'. Categories: Below 18.5 = Underweight, 18.5-24.9 = Normal weight, 25-29.9 = Overweight, 30+ = Obese."""

def calculate_bmi(weight_kg, height_m):
    bmi = weight_kg/ height_m **2

    bmi = round(bmi, 2)
    
    if bmi <18.5 :
       category = "Under weight"
    elif bmi < 25 :
       category = "Norrmal weight"
    elif bmi < 30:
       category = "Overweight"
    else:
       category = "Obese"
    return {
        'bmi': bmi,
        'category': category
    }

    
print("(70 kg, 1.75 m) ->", calculate_bmi(70, 1.75))
print("(90 kg, 1.75 m) ->", calculate_bmi(90, 1.75))
print("(100 kg, 1.75 m) ->", calculate_bmi(100, 1.75))
