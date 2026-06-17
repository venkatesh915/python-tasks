
class Patient:
    def __init__(self, patient_id, name, age, city):
        self.patient_id = patient_id
        self.name = name
        self.age = age
        self.city = city

    def display_patient(self):
        print("Patient ID:", self.patient_id)
        print("Name:", self.name)
        print("Age:", self.age)
        print("City:", self.city)



class Doctor(Patient):
    def __init__(self, patient_id, name, age, city, doctor_name, specialization):
        super().__init__(patient_id, name, age, city)
        self.doctor_name = doctor_name
        self.__specialization = specialization   

    def display_doctor(self):
        self.display_patient()
        print("Doctor Name:", self.doctor_name)
        print("Specialization:", self.__specialization)


p1 = Patient(1, "Eswar", 25, "Hyderabad")
p1.display_patient()

print("\n----------------------\n")


d1 = Doctor(2, "anil", 21, "Chirala", "Dr. Ramesh", "Cardiology")
d1.display_doctor()




"""
Patient ID: 1
Name: Eswar
Age: 25
City: Hyderabad

----------------------

Patient ID: 2
Name: anil
Age: 21
City: Chirala
Doctor Name: Dr. Ramesh
Specialization: Cardiology


"""
