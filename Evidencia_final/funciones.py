# This function takes a list of numbers, squares each number returns a new list

def square_and_sort(numbers):
    # Square each number in the list using list comprehension
    squared_numbers = [num ** 2 for num in numbers]
    squared_numbers.sort(reverse=True)
    
    return squared_numbers


def print_square_and_sort_result(numbers):
    squared_numbers = square_and_sort(numbers)
    print("Squared numbers in descending order:")
    for num in squared_numbers:
        print(num)


# Example usage
my_numbers = [2, 5, 1, 8, 4]
print_square_and_sort_result(my_numbers)
