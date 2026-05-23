# Swap using Addition and Subtraction

a = int(input("Enter A value: "))
b = int(input("Enter B value: "))

print("\nBefore Swap:")
print("a =", a)
print("b =", b)

a = a + b
b = a - b
a = a - b

print("\nAfter Swap using Add/Sub:")
print("a =", a)
print("b =", b)


# Swap using Multiplication and Division

a = int(input("\nEnter A value: "))
b = int(input("Enter B value: "))

print("\nBefore Swap:")
print("a =", a)
print("b =", b)

a = a * b
b = a / b
a = a / b

print("\nAfter Swap using Mul/Div:")
print("a =", a)
print("b =", b)


# Swap using XOR

a = int(input("\nEnter A value: "))
b = int(input("Enter B value: "))

print("\nBefore Swap:")
print("a =", a)
print("b =", b)

a = a ^ b
b = a ^ b
a = a ^ b

print("\nAfter Swap using XOR:")
print("a =", a)
print("b =", b)


# Python Simple Swap

a = int(input("\nEnter A value: "))
b = int(input("Enter B value: "))

print("\nBefore Swap:")
print("a =", a)
print("b =", b)

a, b = b, a

print("\nAfter Python Swap:")
print("a =", a)
print("b =", b)