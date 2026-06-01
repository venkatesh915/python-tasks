#Question 4: Method Overriding 

class Animal:
    def sound(self):
        print("Animals makes sound")
    
class Dog(Animal):
    def sound(self):
        print("Dod says Bark")
class Cat(Animal):
    def sound(self):
        print("Cats says Meow")

c = Cat()
d= Dog()
c.sound()
d.sound()