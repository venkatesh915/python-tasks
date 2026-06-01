class Employee:
    def __init__(self,emp_id, name, department, salary, email,phone,experience):
        self.emp_id = emp_id
        self.name = name
        self.department = department
        self.__salary = salary
        self.email = email
        self.phone= phone
        self.experience= experience
        self.attendance = 0
        self.leave_balance = 20

    def display(self):
        print("================================")
        print("Employee details")
        print("Employee ID:",self.emp_id)
        print("Employee Name:",self.name)
        print("Department:",self.department)
        print("Emp Salary:",self.__salary)
        print("Emp email",self.email)
        print("Phone", self.phone)
        print("Experience", self.experience)
        print("Attendance", self.attendance)
        print("Leave Bal", self.leave_balance)
    
    def mark_attendance(self):
        self.attendance +=1
        print("Attendance updated successfully.")
    
    def increment_salary(self,percent):
        increment_amount = self.__salary * percent /100
        self.__salary += increment_amount
        print("Salary updated.")
    
    def calculate_bonus(self):
        if self.attendance >= 25:
            return 5000
        elif self.attendance >=15:
            return 3000
        else:
            return 1000
    
    def apply_leave(self,days):
        if days <=self.leave_balance:
            self.leave_balance -= days
            print("Leave Approved")
        else :
            print("Insufficient leave balance")
    
    def show_leave_balance(self):
        print("Remaining leave balance:",self.leave_balance)


        
    def transfer_department(self,new_department):
        old_department = self.department
        self.department = new_department
        print(f"Transferred from {old_department} to {new_department}")
    
    def generate_salary_slip(self):
        bonus = self.calculate_bonus()
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
    employee.append(emp)
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
        if emp.emp_id == emp_id:
            employee.remove(emp)
            print("Employee removed successfully")
            return
    print("Employee not found")

def mark_attendance():
    emp = search_employee()
    if emp:
        emp.mark_attendance()

def apply_leave():
    emp = search_employee()
    if emp:
        days = int(input("Enter number of leave days: "))
        emp.apply_leave(days)

def update_salary():
    emp = search_employee()
    if emp:
        percentage = float(input('Enter increment percentage:'))
        emp.increment_salary(percentage)

def transfer_department():
    emp = search_employee()
    if emp:
        new_department = input("Enter new department: ")
        emp.transfer_department(new_department)

def show_leave_balance():
    emp = search_employee()
    if emp:
        emp.show_leave_balance()

def calculate_bonus():
    emp = search_employee()

    if emp:
        print("Bonus amount", emp.calculate_bonus())

def generate_salary_slip():
    emp = search_employee()
    if emp:
        emp.generate_salary_slip()

def get_salary():
    emp = search_employee()
    if emp:
        print("Current Salary:", emp.get_salary())

while True:
    print()
    print("================================")
    print("SMART HR MANAGEMENT SYSTEM")
    print("================================")
    print("1.Add Employee")
    print("2.View Employees")
    print("3.Search Employee")
    print("4.Remove EMployee")
    print("5. Mark Attendance")
    print("6. Update Salary")
    print("7. Calculate Bonus")
    print("8. Apply leave")
    print("9. Transfer department")
    print("10. Generate Salary Slip")
    print("11. Show Leave Balance")
    print("12. Get Salary")
    print("13. Exit")


    choice=int(input("ENter choice: "))
    if choice == 1:
        add_employee()
    elif choice == 2:
        view_employee()
    elif choice == 3:
        search_employee()
    elif choice == 4:
        remove_employee()
    elif choice == 5:
        mark_attendance()
    elif choice == 6:
        update_salary()
    elif choice == 7:
        calculate_bonus()
    elif choice == 8:
        apply_leave()
    elif choice == 9:
        transfer_department()
    elif choice == 10:
        generate_salary_slip()
    elif choice == 11:
        show_leave_balance()
    elif choice == 12:
        get_salary()
    elif choice == 13:
        print("Thank you")
        break
    else:
        print("Invalid choice")




       


