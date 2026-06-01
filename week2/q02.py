#Question 2: Constructor and Instance Variables 

class Employee:
    def __init__(self,employee_id,employee_name,salary):
        self.employee_id= employee_id
        self.employee_name = employee_name
        self.salary = salary
    def show(self):
        print("Employee ID:",self.employee_id)
        print("Employee Name:",self.employee_name)
        print("Salary:",self.salary)
        print()
e1 = Employee("4201","MANI",10050)
e2 = Employee("4202","HARI",12500)
e3 = Employee(4203,"jack",13500)

e1.show()
e2.show()
e3.show()