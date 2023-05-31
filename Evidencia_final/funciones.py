# Function to check if a number is prime
def is_prime(number):
    if number < 2:
        return False
    for i in range(2, int(number ** 0.5) + 1):
        if number % i == 0:
            return False
    return True

# List of numbers
numbers = [3, 7, 12, 5, 23, 17]

# Dictionary of names and ages
people = {"Alice": 25, "Bob": 30, "Charlie": 35}

# List method: append
numbers.append(10)

# Assignment operator
x = 5

# Logical operator
is_even = (x % 2 == 0)

# Arithmetic operators
addition_result = x + 10
subtraction_result = x - 3
multiplication_result = x * 4
division_result = x / 2

# Comparison operators
greater_than_result = x > 3
less_than_result = x < 10
equality_result = x == 5

# Boolean values
is_prime_number = is_prime(x)

# Printing the results
print("Numbers:", numbers)
print("People:", people)
print("Is Even:", is_even)
print("Addition:", addition_result)
print("Subtraction:", subtraction_result)
print("Multiplication:", multiplication_result)
print("Division:", division_result)
print("Greater Than:", greater_than_result)
print("Less Than:", less_than_result)
print("Equality:", equality_result)
print("Is Prime Number:", is_prime_number)
