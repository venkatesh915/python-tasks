"""Question 1: Class and Object Creation """

class Student:
    def __init__(self,name,roll_number,marks):
        self.name = name
        self.roll_number = roll_number
        self.marks = marks

    def display_details(self):
        print(f"Name: {self.name}\nRoll Number: {self.roll_number}\nMarks: {self.marks}")
        print()
s1 = Student("venky","L1",99)
s2 = Student("Anil",101,89)


s1.display_details()
s2.display_details()
