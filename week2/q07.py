# Question 7: Dictionary-Based Student Management System 
students = {
    "venky": {"Marks": 90,"Grade":"A" },
    "Mani": {"Marks":85, "Grade": "B"},
    "Anil": {"Marks":95, "Grade": "O"}
}
for name,details in students.items():
    print("Name",name)
    print("Marks:",details["Marks"])
    print("Grade:",details["Grade"])
    print()

highest = max(students , key=lambda x: students[x]["Marks"])
print("Top Student:",highest)
print("Highest Marks",students[highest]["Marks"])