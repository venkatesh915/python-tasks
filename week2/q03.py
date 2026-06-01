#3. Question 3: Inheritance 

class Vehicle:
    def start(self):
        print('Vehicle Started')
    def stop(self):
        print("Vehicle stopped")

class Car(Vehicle):
    def drive(self):
        print("Car driving")


c = Car()
c.start()
c.drive()
c.stop()