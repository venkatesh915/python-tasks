"""4. Write a function is_palindrome(text) that returns True if the text is a palindrome (reads the same forwards and backwards) and False otherwise. Ignore spaces and capitalization before checking."""

def is_palindrome(text):

    cleaned_text = text.replace(" ","").lower()
    return cleaned_text == cleaned_text[::-1]

print("'level' ->",is_palindrome("level"))
print("'Hello' ->",is_palindrome("Hello"))
print("'racecar' ->",is_palindrome("racecar"))
print("'A man a plan a canal Panama' ->",is_palindrome("A man a plan a canal Panama"))