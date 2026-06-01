class Movie:
    def __init__(self,movie_id,name,price,seats):
        self.movie_id = movie_id
        self.name = name
        self.price = price
        self.seats = seats
        self.booked_seats = 0
    def display(self):
        print("===========================")
        print("Movie details:")
        print("Movie name",self.name)
        print("Ticket price:",self.price)
        print("Available tickets",self.seats - self.booked_seats)


    def book_ticket(self,tickets):
        if tickets <=(self.seats - self.booked_seats):
            self.booked_seats += tickets
            total = tickets * self.price
            print("Total amount",total)
        else:
            print("not enough seats available")
        
    
    def cancel_ticket(self,ticket):
        if ticket <=self.booked_seats:
            self.booked_seats -= ticket
            print("Ticket cancelled")
        else:
            print("you entered ticket more than booked tickets")

    
movies=[]

def add_movie():
        print("Add movie:")
        movie_id = int(input("Enter movie id:"))
        name = input("Enter movie name:")
        price= float(input("Enter ticket price:"))
        seats = int(input("Enter total seats:"))

        movie = Movie(movie_id,name,price,seats)
        movies.append(movie)
        print("Movie added successfully")

def view_movies():
        if len(movies) == 0:
            print("No movie found")
            return 
        for i in movies:
            i.display()

def search_movie():
        movie_id = int(input("Enter movie id:"))
        for i in movies:
            if i.movie_id == movie_id:
                i.display()
                return i
        print("Movie not found")
        return None
    
def book_ticket():
        movie = search_movie()
        if movie:
            tickets = int(input("Enter no of tickets: "))
            movie.book_ticket(tickets)

def cancel_ticket():
        movie = search_movie()
        if movie:
            tickets = int(input("Enter number of tickets: "))
            movie.cancel_ticket(tickets)

while True:
    print()
    print("================================")
    print("MOVIE TICKET MANAGEMENT SYSTEM")
    print("================================")
    print("1. Add movie")
    print("2. View movies")
    print("3. Search movie")
    print("4. Book ticket")
    print("5. Cancel ticket")
    print("6. Exit")

    choice = int(input("Enter choice: "))

    if choice == 1:
        add_movie()
    elif choice == 2:
        view_movies()
    elif choice == 3:
        search_movie()
    elif choice == 4:
        book_ticket()
    elif choice == 5:
        cancel_ticket()
    elif choice == 6:
        print("Thank you")
        break
    else:
        print("Invalid choice")