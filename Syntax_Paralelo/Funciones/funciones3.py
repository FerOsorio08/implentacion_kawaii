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