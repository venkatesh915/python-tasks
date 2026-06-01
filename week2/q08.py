#Question 8: File Handling 

file = open("student.txt","w")
names = ["Anil","Venky","Mani","Sai","Jack"]

for name in names:
    file.write(name +"\n")

file.close()
file = open("student.txt","r")
data = file.readlines()

print("Students names:")
for line in data:
    print(line.strip())
    print()

print("Total students:",len(data))
file.close()