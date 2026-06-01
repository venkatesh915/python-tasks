"""10. Create a function validate_password(password) that checks five security rules: (1) at least 8 characters, (2) at least one uppercase letter, (3) at least one lowercase letter, (4) at least one digit, (5) at least one special character from !@#$%^&*. Return a dict with 'is_valid' (True/False) and 'errors' (list of failed rules)."""

def validate_password(password):
    errors=[]
    special_char= " !@#$%^&*"
    
    if len(password) <8:
        errors.append("Password must be at least 8 characters long")
    if not any (char .isupper() for char in password):
        errors.append("Password must contain at least one uppercase letter")
    if not any (char .islower() for char in password):
        errors.append("Password must contain at least one lowercase letter")
    if not any(char.isdigit() for char in password):
        errors.append("Password must contain at least one digit")
    if not any(char in special_char for char in password):
        errors.append("Password must contain at least one special character (!@#$%^&*)")
    return {
         'is_valid': len(errors) == 0,
        'errors': errors
    }

print("'weak' ->", validate_password("weak"))
print()
print("'Weak123' ->", validate_password("Weak123"))
print()
print("'MySecure@1' ->", validate_password("MySecure@1"))