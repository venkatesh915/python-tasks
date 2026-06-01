# Swap Two Numbers using User Choice

a = int(input("Enter A value: "))
b = int(input("Enter B value: "))

print("\nChoose Swap Method\n1. Add/Sub\n2. Mul/Div\n3. XOR\n4. Python Swap")

choice = int(input("\nEnter your choice (1-4): "))

print(f"\nYou selected Method {choice} :")
print("\nBefore Swap:")
print("a =", a)
print("b =", b)

x = a
y = b

# Method 1
if choice == 1:
    x = x + y
    y = x - y
    x = x - y

    print("\nAfter Swap using Add/Sub:")

# Method 2
elif choice == 2:
    x = x * y
    y = x / y
    x = x / y

    print("\nAfter Swap using Mul/Div:")

# Method 3
elif choice == 3:
    x = x ^ y
    y = x ^ y
    x = x ^ y

    print("\nAfter Swap using XOR:")

# Method 4
elif choice == 4:
    x, y = y, x

    print("\nAfter Swap using Python Swap:")

else:
    print("\nInvalid Choice")
    exit()

print("a =", x)
print("b =", y)