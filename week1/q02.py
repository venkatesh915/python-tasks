"""2. Create a function assign_grade(score) that assigns a letter grade based on a students score: 90-100=A, 80-89=B, 70-79=C, 60-69=D, below 60=F. Handle invalid scores (below 0 or above 100) by returning 'Invalid Score'.
"""

def assign_grade(score):
    if score <0 or score>100:
        return "invalid marks"
    elif score >=90:
        return "A"
    elif score >=80:
        return "B"
    elif score >=70:
        return "C"
    elif score >=60:
        return "D"
    else:
        return "F"
    
print("assign_grade(95) ->",assign_grade(95))
print("assign_grade(85) ->",assign_grade(85))
print("assign_grade(75) ->",assign_grade(75))
print("assign_grade(65) ->",assign_grade(65))
print("assign_grade(55) ->",assign_grade(55))
print("assign_grade(105) ->",assign_grade(105))