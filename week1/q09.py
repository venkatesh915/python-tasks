"""9. Write a function calculate_total(prices, discount_percent=0) that sums a list of item prices, applies an optional discount percentage, and returns a dictionary with subtotal, discount_amount, and final_total. The discount_percent defaults to 0."""

def calculate_total(prices, discount_percent=0):
    subtotal =sum(prices)
    discount_amount =  (subtotal * discount_percent) / 100
    final_total = subtotal - discount_amount