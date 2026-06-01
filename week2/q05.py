#Question 5: Polymorphism 
class Circle:
    def area(self,radius):
        return 3.14* radius * radius
    
class Rectangle:
    def area(self,length,width):
        return length * width
c = Circle()
r = Rectangle()


radius = float(input("Enter radius:"))
print("Area of circle:",c.area(radius))

length = float(input("Enter length:"))
width = float(input("Enter width:"))

print("Area of rectangle:",r.area(length,width))