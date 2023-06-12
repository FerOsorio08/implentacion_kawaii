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

# Checking if a number is a happy prime
def is_prime(n):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True

def is_happy(n):
    seen = set()
    while n != 1 and n not in seen:
        seen.add(n)
        n = sum(int(digit) ** 2 for digit in str(n))
    return n == 1

num = 7
is_happy_prime = is_prime(num) and is_happy(num)

# Checking if a number is a perfect square using the Babylonian method
num = 16
approximation = num
while abs(approximation ** 2 - num) > 10:
    approximation = (approximation + num / approximation) / 2
is_perfect_square = int(approximation) ** 2 == num

# Checking if a number is a Fibonacci number
def is_fibonacci(n):
    a, b = 0, 1
    while b < n:
        a, b = b, a + b
    return b == n

num = 8
is_fibonacci_number = is_fibonacci(num)

# Checking if a string is a pangram
import string

def is_pangram(sentence):
    sentence = sentence.lower()
    return all(letter in sentence for letter in string.ascii_lowercase)

text = "The quick brown fox jumps over the lazy dog"
is_pangram_text = is_pangram(text)

# Checking if a number is a perfect number using Euler's formula
def is_perfect(n):
    return n == 2 ** (n.bit_length() - 1) * (2 ** n.bit_length() - 1)

num = 28
is_perfect_number_euler = is_perfect(num)

# Checking if a string is a valid palindrome using recursion
def is_valid_palindrome_recursive(s):
    s = "".join(filter(str.isalnum, s.lower()))
    if len(s) <= 1:
        return True
    if s[0] != s[-1]:
        return False
    return is_valid_palindrome_recursive(s[1:-1])

text = "A man, a plan, a canal: Panama"
is_valid_palindrome_recursive_text = is_valid_palindrome_recursive(text)

# Checking if a number is a narcissistic number using recursion
def is_narcissistic_recursive(n):
    if n < 10:
        return True
    num_str = str(n)
    num_length = len(num_str)
    narc_sum = sum(int(digit) ** num_length for digit in num_str)
    return narc_sum == n and is_narcissistic_recursive(narc_sum)

num = 153
is_narcissistic_recursive_num = is_narcissistic_recursive(num)

# Checking if a number is a happy number using recursion
def is_happy_recursive(n):
    if n == 1 or n == 7:
        return True
    if n < 10:
        return False
    return is_happy_recursive(sum(int(digit) ** 2 for digit in str(n)))

num = 19
is_happy_recursive_num = is_happy_recursive(num)

# Checking if a number is a vampire number
def is_vampire(n):
    num_str = str(n)
    if len(num_str) % 2 != 0:
        return False
    digits = [int(d) for d in num_str]
    pairs = [(digits[i], digits[j]) for i in range(len(digits)) for j in range(len(digits)) if i != j]
    for pair in pairs:
        a, b = pair
        if (a % 10 == 0 and b % 10 == 0) or sorted(str(a * b)) != sorted(num_str):
            continue
        return True
    return False

num = 1260
is_vampire_number = is_vampire(num)

# Checking if a number is a Duck number
def is_duck(n):
    return "0" in str(n) and str(n).lstrip("0") != "0"

num = 1023
is_duck_number = is_duck(num)

# Checking if a number is a Smith number
def is_smith(n):
    def prime_factors(n):
        i = 2
        factors = []
        while i * i <= n:
            if n % i:
                i += 1
            else:
                n //= i
                factors.append(i)
        if n > 1:
            factors.append(n)
        return factors

    digit_sum = sum(int(digit) for digit in str(n))
    prime_factor_sum = sum(prime_factors(n))
    return digit_sum == prime_factor_sum

num = 666
is_smith_number = is_smith(num)

# Checking if a string is a pangram using all alphabets
def is_pangram_all(s):
    return all(letter in s.lower() for letter in string.ascii_lowercase)

text = "The quick brown fox jumps over the lazy dog"
is_pangram_all_text = is_pangram_all(text)

# Checking if a number is a Harshad number
num = 18
is_harshad = num % sum(int(digit) for digit in str(num)) == 0

# Checking if a number is a Keith number
def is_keith(n):
    num_str = str(n)
    digits = [int(digit) for digit in num_str]
    while sum(digits) < n:
        digits.append(sum(digits[-len(num_str):]))
    return sum(digits[-len(num_str):]) == n

num = 197
is_keith_number = is_keith(num)

# Checking if a number is a narcissistic number using recursion
def is_narcissistic_recursive(n):
    num_str = str(n)
    num_length = len(num_str)
    narc_sum = sum(int(digit) ** num_length for digit in num_str)
    if narc_sum == n:
        return True
    elif narc_sum < n or num_length == 1:
        return False
    else:
        return is_narcissistic_recursive(narc_sum)

num = 153
is_narcissistic_recursive_num = is_narcissistic_recursive(num)

# Checking if a string is a valid palindrome using recursion
def is_valid_palindrome_recursive(s):
    s = "".join(filter(str.isalnum, s.lower()))
    if len(s) <= 1:
        return True
    if s[0] != s[-1]:
        return False
    return is_valid_palindrome_recursive(s[1:-1])

text = "A man, a plan, a canal: Panama"
is_valid_palindrome_recursive_text = is_valid_palindrome_recursive(text)

# Checking if a number is a perfect number using recursion
def is_perfect_recursive(n):
    divisors = [1]
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            divisors.extend([i, n // i])
    if sum(divisors) == n:
        return True
    else:
        return False

num = 28
is_perfect_recursive_num = is_perfect_recursive(num)

# Checking if a number is a palindrome using recursion
def is_palindrome_recursive(n):
    num_str = str(n)
    if len(num_str) <= 1:
        return True
    if num_str[0] != num_str[-1]:
        return False
    return is_palindrome_recursive(num_str[1:-1])

num = 12321
is_palindrome_recursive_num = is_palindrome_recursive(num)

# Checking if a number is a prime number using recursion
def is_prime_recursive(n, i=2):
    if n < 2:
        return False
    if n == 2:
        return True
    if n % i == 0:
        return False
    if i * i > n:
        return True
    return is_prime_recursive(n, i + 1)

num = 7
is_prime_recursive_num = is_prime_recursive(num)

# Checking if a number is a happy number using recursion
def is_happy_recursive(n, seen=set()):
    if n == 1:
        return True
    if n in seen:
        return False
    seen.add(n)
    return is_happy_recursive(sum(int(digit) ** 2 for digit in str(n)), seen)

num = 19
is_happy_recursive_num = is_happy_recursive(num)

# Checking if a number is a perfect square using recursion
def is_perfect_square_recursive(n):
    if n == 0 or n == 1:
        return True
    if n < 0:
        return False
    return is_perfect_square_recursive(n - 2)

num = 16
is_perfect_square_recursive_num = is_perfect_square_recursive(num)

# Checking if a number is a Fibonacci number using recursion
def is_fibonacci_recursive(n, a=0, b=1):
    if n == a or n == b:
        return True
    if a + b > n:
        return False
    return is_fibonacci_recursive(n, b, a + b)

num = 8
is_fibonacci_recursive_num = is_fibonacci_recursive(num)

# Checking if a number is a happy prime using recursion
def is_happy_prime_recursive(n):
    return is_prime_recursive(n) and is_happy_recursive(n)

num = 7
is_happy_prime_recursive_num = is_happy_prime_recursive(num)

# Checking if a number is a vampire number using recursion
def is_vampire_recursive(n, seen=set()):
    num_str = str(n)
    if len(num_str) % 2 != 0:
        return False
    if n in seen:
        return False
    if len(num_str) == 2:
        return True
    for i in range(1, len(num_str)):
        prefix = num_str[:i]
        suffix = num_str[i:]
        if prefix[-1] == "0" and suffix[-1] == "0":
            continue
        if prefix[0] == "0":
            continue
        a, b = int(prefix), int(suffix)
        if a * b == n and sorted(str(a) + str(b)) == sorted(num_str):
            return True
    seen.add(n)
    return any(is_vampire_recursive(num, seen) for num in get_permutations(num_str))

num = 1260
is_vampire_recursive_num = is_vampire_recursive(num)

# Checking if a number is a Duck number using recursion
def is_duck_recursive(n):
    if n == 0:
        return False
    if n % 10 == 0:
        return True
    return is_duck_recursive(n // 10)

num = 1023
is_duck_recursive_num = is_duck_recursive(num)

# Checking if a number is a Smith number using recursion
def is_smith_recursive(n, prime_sum=0):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            prime_sum += sum(int(digit) for digit in str(i))
            return is_smith_recursive(n // i, prime_sum)
    prime_sum += sum(int(digit) for digit in str(n))
    digit_sum = sum(int(digit) for digit in str(n))
    return digit_sum == prime_sum

num = 666
is_smith_recursive_num = is_smith_recursive(num)

# Checking if a number is a Harshad number using recursion
def is_harshad_recursive(n, sum_digits=0):
    if n == 0:
        return False
    sum_digits += n % 10
    if n < 10:
        return n % sum_digits == 0
    return is_harshad_recursive(n // 10, sum_digits)

num = 18
is_harshad_recursive_num = is_harshad_recursive(num)

# Checking if a number is a Keith number using recursion
def is_keith_recursive(n, sequence=[]):
    if n == sum(sequence[-len(sequence):]):
        return True
    if n < sum(sequence[-len(sequence):]):
        return False
    sequence.append(n)
    return is_keith_recursive(n, sequence)

num = 197
is_keith_recursive_num = is_keith_recursive(num)

# Checking if a string is a pangram using recursion
def is_pangram_recursive(s, letters=set(string.ascii_lowercase)):
    if not letters:
        return True
    if not s:
        return False
    if s[0].lower() in letters:
        letters.remove(s[0].lower())
    return is_pangram_recursive(s[1:], letters)

text = "The quick brown fox jumps over the lazy dog"
is_pangram_recursive_text = is_pangram_recursive(text)

# Checking if a number is a Duck number using recursion
def is_duck_recursive(n):
    if n == 0:
        return False
    if n % 10 == 0:
        return True
    return is_duck_recursive(n // 10)

num = 1023
is_duck_recursive_num = is_duck_recursive(num)

# Checking if a number is a Smith number using recursion
def is_smith_recursive(n, prime_sum=0):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            prime_sum += sum(int(digit) for digit in str(i))
            return is_smith_recursive(n // i, prime_sum)
    prime_sum += sum(int(digit) for digit in str(n))
    digit_sum = sum(int(digit) for digit in str(n))
    return digit_sum == prime_sum

num = 666
is_smith_recursive_num = is_smith_recursive(num)

# Checking if a Harshad number using recursion
def is_harshad_recursive(n, sum_digits=0):
    if n == 0:
        return False
    sum_digits += n % 10
    if n < 10:
        return n % sum_digits == 0
    return is_harshad_recursive(n // 10, sum_digits)

num = 18
is_harshad_recursive_num = is_harshad_recursive(num)

# Checking if a Keith number using recursion
def is_keith_recursive(n, sequence=[]):
    if n == sum(sequence[-len(sequence):]):
        return True
    if n < sum(sequence[-len(sequence):]):
        return False
    sequence.append(n)
    return is_keith_recursive(n, sequence)

num = 197
is_keith_recursive_num = is_keith_recursive(num)

# Checking if a string is a pangram using recursion
def is_pangram_recursive(s, letters=set(string.ascii_lowercase)):
    if not letters:
        return True
    if not s:
        return False
    if s[0].lower() in letters:
        letters.remove(s[0].lower())
    return is_pangram_recursive(s[1:], letters)

text = "The quick brown fox jumps over the lazy dog"
is_pangram_recursive_text = is_pangram_recursive(text)

# Checking if a number is a Duck number using recursion
def is_duck_recursive(n):
    if n == 0:
        return False
    if n % 10 == 0:
        return True
    return is_duck_recursive(n // 10)

num = 1023
is_duck_recursive_num = is_duck_recursive(num)

# Checking if a number is a Smith number using recursion
def is_smith_recursive(n, prime_sum=0):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            prime_sum += sum(int(digit) for digit in str(i))
            return is_smith_recursive(n // i, prime_sum)
    prime_sum += sum(int(digit) for digit in str(n))
    digit_sum = sum(int(digit) for digit in str(n))
    return digit_sum == prime_sum

num = 666
is_smith_recursive_num = is_smith_recursive(num)

# Checking if a Harshad number using recursion
def is_harshad_recursive(n, sum_digits=0):
    if n == 0:
        return False
    sum_digits += n % 10
    if n < 10:
        return n % sum_digits == 0
    return is_harshad_recursive(n // 10, sum_digits)

num = 18
is_harshad_recursive_num = is_harshad_recursive(num)

# Checking if a Keith number using recursion
def is_keith_recursive(n, sequence=[]):
    if n == sum(sequence[-len(sequence):]):
        return True
    if n < sum(sequence[-len(sequence):]):
        return False
    sequence.append(n)
    return is_keith_recursive(n, sequence)

num = 197
is_keith_recursive_num = is_keith_recursive(num)

# Checking if a string is a pangram using recursion
def is_pangram_recursive(s, letters=set(string.ascii_lowercase)):
    if not letters:
        return True
    if not s:
        return False
    if s[0].lower() in letters:
        letters.remove(s[0].lower())
    return is_pangram_recursive(s[1:], letters)

text = "The quick brown fox jumps over the lazy dog"
is_pangram_recursive_text = is_pangram_recursive(text)

# Checking if a number is a Duck number using recursion
def is_duck_recursive(n):
    if n == 0:
        return False
    if n % 10 == 0:
        return True
    return is_duck_recursive(n // 10)

num = 1023
is_duck_recursive_num = is_duck_recursive(num)

# Checking if a number is a Smith number using recursion
def is_smith_recursive(n, prime_sum=0):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            prime_sum += sum(int(digit) for digit in str(i))
            return is_smith_recursive(n // i, prime_sum)
    prime_sum += sum(int(digit) for digit in str(n))
    digit_sum = sum(int(digit) for digit in str(n))
    return digit_sum == prime_sum

num = 666
is_smith_recursive_num = is_smith_recursive(num)

# Checking if a Harshad number using recursion
def is_harshad_recursive(n, sum_digits=0):
    if n == 0:
        return False
    sum_digits += n % 10
    if n < 10:
        return n % sum_digits == 0
    return is_harshad_recursive(n // 10, sum_digits)

num = 18
is_harshad_recursive_num = is_harshad_recursive(num)

# Checking if a Keith number using recursion
def is_keith_recursive(n, sequence=[]):
    if n == sum(sequence[-len(sequence):]):
        return True
    if n < sum(sequence[-len(sequence):]):
        return False
    sequence.append(n)
    return is_keith_recursive(n, sequence)

num = 197
is_keith_recursive_num = is_keith_recursive(num)

# Checking if a string is a pangram using recursion
def is_pangram_recursive(s, letters=set(string.ascii_lowercase)):
    if not letters:
        return True
    if not s:
        return False
    if s[0].lower() in letters:
        letters.remove(s[0].lower())
    return is_pangram_recursive(s[1:], letters)

text = "The quick brown fox jumps over the lazy dog"
is_pangram_recursive_text = is_pangram_recursive(text)

# Checking if a number is a Duck number using recursion
def is_duck_recursive(n):
    if n == 0:
        return False
    if n % 10 == 0:
        return True
    return is_duck_recursive(n // 10)

num = 1023
is_duck_recursive_num = is_duck_recursive(num)

# Checking if a number is a Smith number using recursion
def is_smith_recursive(n, prime_sum=0):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            prime_sum += sum(int(digit) for digit in str(i))
            return is_smith_recursive(n // i, prime_sum)
    prime_sum += sum(int(digit) for digit in str(n))
    digit_sum = sum(int(digit) for digit in str(n))
    return digit_sum == prime_sum

num = 666
is_smith_recursive_num = is_smith_recursive(num)

# Checking if a Harshad number using recursion
def is_harshad_recursive(n, sum_digits=0):
    if n == 0:
        return False
    sum_digits += n % 10
    if n < 10:
        return n % sum_digits == 0
    return is_harshad_recursive(n // 10, sum_digits)

num = 18
is_harshad_recursive_num = is_harshad_recursive(num)

# Checking if a Keith number using recursion
def is_keith_recursive(n, sequence=[]):
    if n == sum(sequence[-len(sequence):]):
        return True
    if n < sum(sequence[-len(sequence):]):
        return False
    sequence.append(n)
    return is_keith_recursive(n, sequence)

num = 197
is_keith_recursive_num = is_keith_recursive(num)

# Checking if a string is a pangram using recursion
def is_pangram_recursive(s, letters=set(string.ascii_lowercase)):
    if not letters:
        return True
    if not s:
        return False
    if s[0].lower() in letters:
        letters.remove(s[0].lower())
    return is_pangram_recursive(s[1:], letters)

text = "The quick brown fox jumps over the lazy dog"
is_pangram_recursive_text = is_pangram_recursive(text)

# Checking if a number is a Duck number using recursion
def is_duck_recursive(n):
    if n == 0:
        return False
    if n % 10 == 0:
        return True
    return is_duck_recursive(n // 10)

num = 1023
is_duck_recursive_num = is_duck_recursive(num)

# Checking if a number is a Smith number using recursion
def is_smith_recursive(n, prime_sum=0):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            prime_sum += sum(int(digit) for digit in str(i))
            return is_smith_recursive(n // i, prime_sum)
    prime_sum += sum(int(digit) for digit in str(n))
    digit_sum = sum(int(digit) for digit in str(n))
    return digit_sum == prime_sum

num = 666
is_smith_recursive_num = is_smith_recursive(num)

# Checking if a Harshad number using recursion
def is_harshad_recursive(n, sum_digits=0):
    if n == 0:
        return False
    sum_digits += n % 10
    if n < 10:
        return n % sum_digits == 0
    return is_harshad_recursive(n // 10, sum_digits)

num = 18
is_harshad_recursive_num = is_harshad_recursive(num)

# Checking if a Keith number using recursion
def is_keith_recursive(n, sequence=[]):
    if n == sum(sequence[-len(sequence):]):
        return True
    if n < sum(sequence[-len(sequence):]):
        return False
    sequence.append(n)
    return is_keith_recursive(n, sequence)

num = 197
is_keith_recursive_num = is_keith_recursive(num)

# Checking if a string is a pangram using recursion
def is_pangram_recursive(s, letters=set(string.ascii_lowercase)):
    if not letters:
        return True
    if not s:
        return False
    if s[0].lower() in letters:
        letters.remove(s[0].lower())
    return is_pangram_recursive(s[1:], letters)

text = "The quick brown fox jumps over the lazy dog"
is_pangram_recursive_text = is_pangram_recursive(text)

# Checking if a number is a Duck number using recursion
def is_duck_recursive(n):
    if n == 0:
        return False
    if n % 10 == 0:
        return True
    return is_duck_recursive(n // 10)

num = 1023
is_duck_recursive_num = is_duck_recursive(num)

# Checking if a number is a Smith number using recursion
def is_smith_recursive(n, prime_sum=0):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            prime_sum += sum(int(digit) for digit in str(i))
            return is_smith_recursive(n // i, prime_sum)
    prime_sum += sum(int(digit) for digit in str(n))
    digit_sum = sum(int(digit) for digit in str(n))
    return digit_sum == prime_sum

num = 666
is_smith_recursive_num = is_smith_recursive(num)

# Checking if a Harshad number using recursion
def is_harshad_recursive(n, sum_digits=0):
    if n == 0:
        return False
    sum_digits += n % 10
    if n < 10:
        return n % sum_digits == 0
    return is_harshad_recursive(n // 10, sum_digits)

num = 18
is_harshad_recursive_num = is_harshad_recursive(num)

# Checking if a Keith number using recursion
def is_keith_recursive(n, sequence=[]):
    if n == sum(sequence[-len(sequence):]):
        return True
    if n < sum(sequence[-len(sequence):]):
        return False
    sequence.append(n)
    return is_keith_recursive(n, sequence)

num = 197
is_keith_recursive_num = is_keith_recursive(num)

# Checking if a string is a pangram using recursion
def is_pangram_recursive(s, letters=set(string.ascii_lowercase)):
    if not letters:
        return True
    if not s:
        return False
    if s[0].lower() in letters:
        letters.remove(s[0].lower())
    return is_pangram_recursive(s[1:], letters)

text = "The quick brown fox jumps over the lazy dog"
is_pangram_recursive_text = is_pangram_recursive(text)

# Checking if a number is a Duck number using recursion
def is_duck_recursive(n):
    if n == 0:
        return False
    if n % 10 == 0:
        return True
    return is_duck_recursive(n // 10)

num = 1023
is_duck_recursive_num = is_duck_recursive(num)

# Checking if a number is a Smith number using recursion
def is_smith_recursive(n, prime_sum=0):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            prime_sum += sum(int(digit) for digit in str(i))
            return is_smith_recursive(n // i, prime_sum)
    prime_sum += sum(int(digit) for digit in str(n))
    digit_sum = sum(int(digit) for digit in str(n))
    return digit_sum == prime_sum

num = 666
is_smith_recursive_num = is_smith_recursive(num)

# Checking if a Harshad number using recursion
def is_harshad_recursive(n, sum_digits=0):
    if n == 0:
        return False
    sum_digits += n % 10
    if n < 10:
        return n % sum_digits == 0
    return is_harshad_recursive(n // 10, sum_digits)

num = 18
is_harshad_recursive_num = is_harshad_recursive(num)

# Checking if a Keith number using recursion
def is_keith_recursive(n, sequence=[]):
    if n == sum(sequence[-len(sequence):]):
        return True
    if n < sum(sequence[-len(sequence):]):
        return False
    sequence.append(n)
    return is_keith_recursive(n, sequence)

num = 197
is_keith_recursive_num = is_keith_recursive(num)

# Checking if a string is a pangram using recursion
def is_pangram_recursive(s, letters=set(string.ascii_lowercase)):
    if not letters:
        return True
    if not s:
        return False
    if s[0].lower() in letters:
        letters.remove(s[0].lower())
    return is_pangram_recursive(s[1:], letters)

text = "The quick brown fox jumps over the lazy dog"
is_pangram_recursive_text = is_pangram_recursive(text)

# Checking if a number is a Duck number using recursion
def is_duck_recursive(n):
    if n == 0:
        return False
    if n % 10 == 0:
        return True
    return is_duck_recursive(n // 10)

num = 1023
is_duck_recursive_num = is_duck_recursive(num)

# Checking if a number is a Smith number using recursion
def is_smith_recursive(n, prime_sum=0):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            prime_sum += sum(int(digit) for digit in str(i))
            return is_smith_recursive(n // i, prime_sum)
    prime_sum += sum(int(digit) for digit in str(n))
    digit_sum = sum(int(digit) for digit in str(n))
    return digit_sum == prime_sum

num = 666
is_smith_recursive_num = is_smith_recursive(num)

# Checking if a Harshad number using recursion
def is_harshad_recursive(n, sum_digits=0):
    if n == 0:
        return False
    sum_digits += n % 10
    if n < 10:
        return n % sum_digits == 0
    return is_harshad_recursive(n // 10, sum_digits)

num = 18
is_harshad_recursive_num = is_harshad_recursive(num)

# Checking if a Keith number using recursion
def is_keith_recursive(n, sequence=[]):
    if n == sum(sequence[-len(sequence):]):
        return True
    if n < sum(sequence[-len(sequence):]):
        return False
    sequence.append(n)
    return is_keith_recursive(n, sequence)

num = 197
is_keith_recursive_num = is_keith_recursive(num)

# Checking if a string is a pangram using recursion
def is_pangram_recursive(s, letters=set(string.ascii_lowercase)):
    if not letters:
        return True
    if not s:
        return False
    if s[0].lower() in letters:
        letters.remove(s[0].lower())
    return is_pangram_recursive(s[1:], letters)

text = "The quick brown fox jumps over the lazy dog"
is_pangram_recursive_text = is_pangram_recursive(text)

# Checking if a number is a Duck number using recursion
def is_duck_recursive(n):
    if n == 0:
        return False
    if n % 10 == 0:
        return True
    return is_duck_recursive(n // 10)

num = 1023
is_duck_recursive_num = is_duck_recursive(num)

# Checking if a number is a Smith number using recursion
def is_smith_recursive(n, prime_sum=0):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            prime_sum += sum(int(digit) for digit in str(i))
            return is_smith_recursive(n // i, prime_sum)
    prime_sum += sum(int(digit) for digit in str(n))
    digit_sum = sum(int(digit) for digit in str(n))
    return digit_sum == prime_sum

num = 666
is_smith_recursive_num = is_smith_recursive(num)

# Checking if a Harshad number using recursion
def is_harshad_recursive(n, sum_digits=0):
    if n == 0:
        return False
    sum_digits += n % 10
    if n < 10:
        return n % sum_digits == 0
    return is_harshad_recursive(n // 10, sum_digits)

num = 18
is_harshad_recursive_num = is_harshad_recursive(num)

# Checking if a Keith number using recursion
def is_keith_recursive(n, sequence=[]):
    if n == sum(sequence[-len(sequence):]):
        return True
    if n < sum(sequence[-len(sequence):]):
        return False
    sequence.append(n)
    return is_keith_recursive(n, sequence)

num = 197
is_keith_recursive_num = is_keith_recursive(num)


       
