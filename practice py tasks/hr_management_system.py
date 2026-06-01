class Employee:
    def __init__(self,emp_id, name, department, salary, email,phone,experience):
        self.emp_id = emp_id
        self.name = name
        self.department = department
        self.__salary = salary
        self.email = email
        self.phone= phone
        self.experience= experience

    def dispaly(self):
        print("================================")
        print("Employee details")
        print("Employee ID:",self.emp_id)
        print("Employee Name:",self.name)
        print("Emp department:",self.department)
        print("Emp Salary:",self.salary)
        print("Phone", self.phone)
        print("Experience", self.experience)
        print("Attendance", self.attendance)
        print("Leave Bal", self.leave_balance)
    
    def mark_attendence(self):
        self.attendence +=1
        print("Attendence updated successfullky.")
    
    def increment_salary(self,percent):
        increment_amount = self.__salary * percent /100
        self.__salary += increment_amount
        print("Salary updated.")
    
    def calculate_bonus(self):
        if self.attendence >= 25:
            return 5000
        elif self.attendence >=15:
            return 3000
        else:
            return 1000
    
    def apply_leave(self,days):
        if days <=self.leave_balance:
            self.leave_balance -= days
            print("Leave Approvrd")
        else :
            print("Insufficent leave balance")
    
    def show_leave_balance(self):
        print("Remaining leave balance:",self.leave_balance)


        
    def transfer_department(self,new_department):
        old_department = self.department
        self.department = new_department
        print(f"Transferred from {old_department} to {new_department}")
    
    def generate_salary_slip(self):
        bonus = self.calculate_bonous
        net_salary = self.__salary + bonus
        print()
        print("Salary slip")
        print("Employee ID",self.emp_id)
        print("Employee Name:",self.name)
        print("Department",self.department)
        print("Basic Salary:", self.__salary)
        print("Bonus",bonus)
        print("========================================")
        print("Net Salary :", net_salary)
        print("========================================")
    
    def get_salary(self):
        return self.__salary
    

employee=[]

def add_employee():
    print("Add employee")
    emp_id = int(input("Enter employee id:"))
    name = input("Enter emp name:")
    department = input("Enter emp department:")
    salary = float(input("Enter emp salary:"))
    email = input("Enter emp email:")
    phone=input("Enter emp phone number:")
    experience = int(input("Enter experience"))
    emp = Employee(emp_id,name,department,salary,email,phone,experience)
    employee.appened(emp)
    print("Employee Added Successfully")

    
def view_employee():
    if len(employee) == 0:
        print("No employee found")
        return
    for i in employee:
        i.display()

def search_employee():
    emp_id = int(input("Enter emp id:"))
    for i in employee:
        if i.emp_id == emp_id:
            i.display()
            return i
    print("Employee not found")
    return None

def remove_employee():
    emp_id = int(input("Enter emp id:"))
    for emp in employee:
        if emp.emp_id == emp_id
        employee.remove(emp)
        print("Employee removed successfully")
        return
    print("Employee not found")

def mark_attendence():
    emp = search_employee()
    if emp:
        emp.mark_attendence()

def update_salary():
    emp = search_salary()
    if emp:
        percentage = float(input('Enter increment percentage:'))
        emp.increment_salary(percentage)


def calculate_bonus():
    emp = search_employee()

    if emp:
        print("Bonus amount", emp.calculate_bonus)

while True:
    print()
    
    




       


