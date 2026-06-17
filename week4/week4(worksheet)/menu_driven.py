


patients = []


def add_patient():
    patient_id = int(input("Enter patient id:"))
    name = input("Enter patient name:")
    age = int(input("Enter age:"))
    city = input("Enter city:")

    patient = {
        "patient_id": patient_id,
        "name": name,
        "age": age,
        "city": city
    }

    patients.append(patient)
    print("Patient added successfully!")



def view_patients():
    if len(patients) == 0:
        print("No patients found!")
        return

    for p in patients:
        print(p)



def search_patient():
    search_id = int(input("Enter patient id to search:"))

    for p in patients:
        if p["patient_id"] == search_id:
            print("Patient found:")
            print(p)
            return

    print("Patient not found!")



while True:
    print("\n===== HOSPITAL MENU =====")
    print("1. Add patient")
    print("2. View patients")
    print("3. Search patient")
    print("4. Exit")

    choice = input("Enter your choice:")

    if choice == "1":
        add_patient()

    elif choice == "2":
        view_patients()

    elif choice == "3":
        search_patient()

    elif choice == "4":
        print("Exiting program...")
        break

    else:
        print("Invalid choice! try again.")