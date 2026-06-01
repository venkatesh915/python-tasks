"""7. Write a function convert_case(text, case_type) that converts a string to the specified case: 'upper' -> UPPERCASE, 'lower' -> lowercase, 'title' -> Title Case. Return an error message for any other case_type value."""

def convert_case(text, case_type):
    if case_type =="upper":
        return text.upper()
    
    elif case_type =="lower":
        return text.lower()
    elif case_type =="title":
        return text.title()
    else:
        return "Invalid Case_Type"

print(convert_case("hello world", "upper"))
print(convert_case("HELLO WORLD", "lower"))
print(convert_case("hello world", "title"))
print(convert_case("hello", "caps"))
