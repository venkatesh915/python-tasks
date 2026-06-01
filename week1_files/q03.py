"""
3. Write a function calculate_statistics(numbers) that takes a list of numbers and returns a dictionary with: mean (average), max, min, and count. Handle the case where an empty list is passed in.
"""
def calculate_statistics(numbers):
    if len(numbers)==0:
        return {
            'mean':0,
            'max':None,
            'min':None,
            'count':0
        }
    else:
        return {
            "mean":sum(numbers)/len(numbers),
            "max":max(numbers),
            "min":min(numbers),
            "count":len(numbers)
        }
    
print("[10,20,30,40,50] ->",calculate_statistics([10, 20, 30, 40, 50]))
print("[] ->", calculate_statistics([]))