""" 6. Write a function separate_even_odd(numbers) that takes a list of integers and returns a tuple of two lists: the first containing even numbers, the second containing odd numbers. Use the modulo operator to check divisibility."""
def separate_even_odd(numbers):
    even_list =[]
    odd_list =[]

    for num in numbers:
        if num % 2 == 0:
            even_list.append(num)
            
        else:
            odd_list.append(num)
           
    return even_list  , odd_list


even, odd = separate_even_odd([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])


print("even:", even)
print("odd:", odd)