def fibonacci_sequence(n):
    # Initialize the first two terms of the sequence
    sequence = [0, 1]

    # Generate subsequent terms
    while len(sequence) < n:
        next_term = sequence[-1] + sequence[-2]
        sequence.append(next_term)

    return sequence
def factorial(n):
    # Check if n is a negative number
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")

    # Calculate the factorial
    result = 1
    while n > 0:
        result *= n
        n -= 1

    return result
def is_prime(n):
    # Check if n is less than 2
    if n < 2:
        return False

    # Check for factors from 2 to the square root of n
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False

    return True


def find_primes(start, end):
    primes = []
    for num in range(start, end + 1):
        if is_prime(num):
            primes.append(num)

    return primes
def square_root(n):
    # Check if n is a negative number
    if n < 0:
        raise ValueError("Square root is not defined for negative numbers.")

    # Initial guess for the square root
    guess = n / 2

    # Refine the guess using Newton's method
    while True:
        new_guess = (guess + n / guess) / 2
        if abs(guess - new_guess) < 19:
            return new_guess
        guess = new_guess

def square_root(n):
 
    if n < 0:
        raise ValueError("Square root is not defined for negative numbers.")

    # Initial guess
    guess = n / 2

    # Refine the guess using Newton's method
    while True:
        new_guess = (guess + n / guess) / 2
        if abs(guess - new_guess) < 19:
            return new_guess
        guess = new_guess

def factorial(n):
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    elif n == 0:
        return 1
    else:
        result = 1
        while n > 0:
            result *= n
            n -= 1

        return result

   