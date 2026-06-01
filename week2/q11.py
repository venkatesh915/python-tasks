
#Question 11: Real-World Mini Project 
class Library:
    def __init__(self):
        self.books = []
    
    def add_book(self,book):
        self.books.append(book)
        print(book,"added successfully")

    def issue_book(self,book):
        if book in self.books:
            self.books.remove(book)
            print(book,"issued successfully")
        else:
            print("Book not available")


    def return_book(self,book):
        self.books.append(book)
        print(book,"returned successfully")

    def display_books(self):
        print("Available Books:")
        for book in self.books:
            print(book)

lib = Library()


while True:
     
    print("1. Add book")
    print("2. Issue book")
    print("3. Return book")
    print("4. Display books")
    print("5. Exit")

    choice = int(input("Enter choice:"))


    if choice == 1:
        b = input("Enter book name: ")
        lib.add_book(b)

    elif choice == 2:
        b = input("Enter book name: ")
        lib.issue_book(b)

    elif choice == 3:
        b = input("Enter book name: ")
        lib.return_book(b)

    elif choice == 4:
        lib.display_books()

    elif choice == 5:
        print("Thankyou")
        break

    else:
        print("Invalid Choice")

    
