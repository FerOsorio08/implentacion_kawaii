# List creation and initialization
numbers = [1, 2, 3, 4, 5]
fruits = ["apple", "banana", "cherry", "date", "elderberry"]

# Arithmetic operators
sum_numbers = 10 + 5
product_numbers = 10 * 5
division_result = 10 / 5
modulo_result = 10 % 5

# Comparative operators
is_equal = (sum_numbers == product_numbers)
is_not_equal = (division_result != modulo_result)
is_greater_than = (sum_numbers > division_result)
is_less_than_or_equal = (product_numbers <= modulo_result)

# Logical operators
is_valid = True
has_permission = False
can_access = is_valid and has_permission
should_display = is_valid or has_permission
should_hide = not is_valid

# Assignment operators
x = 5
x += 2  # Equivalent to x = x + 2
y = 10
y -= 3  # Equivalent to y = y - 3

# Conditional statements
if x > y:
    print("x is greater than y")
elif x < y:
    print("x is less than y")
else:
    print("x is equal to y")

# Looping through a list
for number in numbers:
    print(number)

# List comprehension
squared_numbers = [number ** 2 for number in numbers]

# Accessing list elements
first_fruit = fruits[0]
last_fruit = fruits[-1]

# Modifying list elements
fruits[1] = "grape"

# List methods
fruits.append("fig")
fruits.insert(2, "kiwi")
fruits.remove("cherry")
fruits.pop()

# String concatenation
greeting = "Hello, " + "world!"

# String methods
greeting_length = len(greeting)
greeting_uppercase = greeting.upper()
greeting_lowercase = greeting.lower()

# Checking membership in a list
is_apple_present = "apple" in fruits
is_banana_absent = "banana" not in fruits

# Slicing a list
sliced_numbers = numbers[1:4]
reversed_numbers = numbers[::-1]

# Iterating over a list with index
for index, fruit in enumerate(fruits):
    print(f"Index: {index}, Fruit: {fruit}")

# Checking empty list
is_empty = len(numbers) == 0

# Clearing a list
fruits.clear()

# Nested lists
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
matrix_size = len(matrix)

# List sorting
numbers.sort()
sorted_numbers = sorted(numbers)

# Boolean variables
is_active = True
is_inactive = False

# String formatting
name = "John"
age = 30
formatted_string = f"My name is {name} and I am {age} years old."

# Checking if a number is even or odd
num = 10
is_even = (num % 2 == 0)
is_odd = (num % 2 != 0)

# Calculating factorial
num = 5
factorial = 1
for i in range(1, num + 1):
    factorial *= i

# Checking prime number
num = 7
is_prime = True
for i in range(2, int(num ** 0.5) + 1):
    if num % i == 0:
        is_prime = False
        break

# Finding maximum and minimum in a list
max_value = max(numbers)
min_value = min(numbers)

# Counting occurrences in a list
count_apple = fruits.count("apple")

# Reversing a string
text = "Hello"
reversed_text = text[::-1]

# Checking palindrome
text = "level"
is_palindrome = (text == text[::-1])

# Checking if a number is positive, negative, or zero
num = -5
if num > 0:
    print("Positive")
elif num < 0:
    print("Negative")
else:
    print("Zero")

# Exiting a loop using 'break'
for number in numbers:
    if number == 3:
        break
    print(number)

# Skipping an iteration using 'continue'
for number in numbers:
    if number == 3:
        continue
    print(number)

# Calculating sum using 'while' loop
total = 0
i = 0
while i <= 10:
    total += i
    i += 1

# Converting string to integer
num_str = "10"
num_int = int(num_str)

# Converting integer to string
num_int = 10
num_str = str(num_int)

# Checking if a string starts or ends with a specific substring
text = "Hello, world!"
starts_with_hello = text.startswith("Hello")
ends_with_exclamation = text.endswith("!")

# Splitting a string into a list
text = "Hello, world!"
words = text.split(",")

# Joining a list into a string
joined_text = ", ".join(words)

# Checking if a list is a sublist of another list
sublist = [2, 3]
is_sublist = sublist in numbers

# Cloning a list
numbers_clone = numbers[:]

# Reversing a list
reversed_numbers = numbers[::-1]

# Checking if all elements of a list satisfy a condition
all_greater_than_zero = all(number > 0 for number in numbers)

# Checking if any element of a list satisfies a condition
any_greater_than_five = any(number > 5 for number in numbers)

# Calculating the average of a list of numbers
average = sum(numbers) / len(numbers)

# Removing duplicates from a list
unique_numbers = list(set(numbers))

# Checking if a list is sorted
is_sorted = numbers == sorted(numbers)

# Removing whitespace from the beginning and end of a string
text = "   Hello, world!   "
trimmed_text = text.strip()

# Checking if a string is alphanumeric
is_alphanumeric = text.isalnum()

# Checking if a string is a valid email address
email = "test@example.com"
is_valid_email = "@" in email and "." in email

# Checking if a string is a valid URL
url = "http://www.example.com"
is_valid_url = url.startswith("http://") or url.startswith("https://")

# Calculating the power of a number
base = 2
exponent = 3
result = base ** exponent

# Swapping two variables
a, b = 5, 10
a, b = b, a

# Calculating the length of a list
list_length = len(numbers)

# Generating a range of numbers
range_numbers = list(range(1, 10, 2))

# Checking if a number is within a range
num = 5
is_within_range = 1 <= num <= 10

# Checking if a string is empty
is_empty_string = len(text) == 0

# Checking if a list is empty
is_empty_list = len(numbers) == 0

# Finding the index of an element in a list
index_of_cherry = fruits.index("cherry")

# Repeating a string
repeated_text = "Hello" * 3

# Checking if a number is a multiple of another number
num1 = 10
num2 = 5
is_multiple = num1 % num2 == 0

# Checking if a number is a power of 2
num = 16
is_power_of_two = (num & (num - 1) == 0) and num != 0

# Checking if a year is a leap year
year = 2024
is_leap_year = (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0)

# Checking if a string is a valid palindrome
text = "level"
is_valid_palindrome = text.lower() == text.lower()[::-1]

# Converting a string to a list of characters
characters = list(text)

# Checking if a list contains only unique elements
is_unique = len(numbers) == len(set(numbers))

# Checking if a number is a prime number using the Sieve of Eratosthenes
n = 100
is_prime = [True] * (n + 1)
is_prime[0] = is_prime[1] = False

p = 2
while p * p <= n:
    if is_prime[p]:
        for i in range(p * p, n + 1, p):
            is_prime[i] = False
    p += 1

# Checking if a number is a perfect square
num = 25
is_perfect_square = (int(num ** 0.5) ** 2 == num)

# Calculating the sum of digits in a number
num = 12345
digit_sum = sum(int(digit) for digit in str(num))

# Converting a number from decimal to binary
decimal_num = 10
binary_num = bin(decimal_num)[2:]

# Converting a number from decimal to hexadecimal
hexadecimal_num = hex(decimal_num)[2:]

# Converting a number from binary to decimal
binary_num = "1010"
decimal_num = int(binary_num, 2)

# Converting a number from hexadecimal to decimal
hexadecimal_num = "A"
decimal_num = int(hexadecimal_num, 16)

# Checking if a number is a perfect number
num = 28
divisors = [1]
for i in range(2, int(num ** 0.5) + 1):
    if num % i == 0:
        divisors.extend([i, num // i])
is_perfect_number = sum(divisors) == num

# Checking if a number is an Armstrong number
num = 153
num_str = str(num)
num_length = len(num_str)
armstrong_sum = sum(int(digit) ** num_length for digit in num_str)
is_armstrong_number = armstrong_sum == num

# Checking if a number is a narcissistic number
num = 1634
num_str = str(num)
num_length = len(num_str)
narcissistic_sum = sum(int(digit) ** num_length for digit in num_str)
is_narcissistic_number = narcissistic_sum == num

# Checking if a number is a happy number
def square_sum_digits(n):
    return sum(int(digit) ** 2 for digit in str(n))

def is_happy_number(n):
    seen = set()
    while n != 1 and n not in seen:
        seen.add(n)
        n = square_sum_digits(n)
    return n == 1

num = 19
is_happy = is_happy_number(num)

# Checking if a number is a perfect power
num = 16
is_perfect_power = any(num ** (1 / i) == int(num ** (1 / i)) for i in range(2, int(num ** 0.5) + 1))

# Checking if a number is a triangular number
num = 10
is_triangular = any(n * (n + 1) // 2 == num for n in range(1, num + 1))

# Checking if a number is a palindrome
num = 12321
is_num_palindrome = str(num) == str(num)[::-1]

# Checking if a string is an anagram of another string
str1 = "listen"
str2 = "silent"
is_anagram = sorted(str1) == sorted(str2)

# Checking if a number is abundant
def get_proper_divisors(n):
    divisors = [1]
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            divisors.extend([i, n // i])
    return divisors

num = 12
sum_divisors = sum(get_proper_divisors(num))
is_abundant = sum_divisors > num



       
