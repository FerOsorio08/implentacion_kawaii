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


