""" 5. Write a function count_items(items_list) that counts how many times each item appears in the list and returns a dictionary with items as keys and their counts as values. Use this for product sales or word frequency analysis.
"""
def count_items(items_list):
    dict={}
    for item in items_list:
        dict[item] = dict.get(item,0)+1
    return dict
items = ['apple', 'banana', 'apple', 'cherry', 'banana', 'apple']
print(items)
print("->",count_items(items))