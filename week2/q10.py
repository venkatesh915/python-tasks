#Question 10: Real-World Mini Project 
class BankAccount:
    def __init__(self,acc_num,acc_name,balance ):
        self.acc_num = acc_num
        self.acc_name = acc_name
        self.balance = balance
    
    def deposit(self,amount):
        self.balance += amount
        print("Deposit successful")

    def withdraw(self,amount):
        if amount > self.amount:
            print("Insufficient balance")
        else:
            self.balance -= amount
    def check_balance(self):
        print("Current balance:",self.balance)

account = BankAccount(4201,"Venky",50000)

while True:
    print("\n1. Deposit")
    print("2. Withdraw")
    print("3. Check Balance")
    print("4. Exit()")

    choice = int(input("Enter Choice:"))
    if choice ==1:
        amount = int(input("Enter Deposit Amount:"))
        account.deposit(amount)
    
    elif choice == 2:
        amount = int(input("Enter Withdraw Amount: "))
        account.withdraw(amount)

    elif choice == 3:
        account.check_balance()

    elif choice == 4:
        print("Thank You")
        break

    else:
        print("Invalid Choice")
