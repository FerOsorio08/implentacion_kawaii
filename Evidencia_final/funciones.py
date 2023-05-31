# Define a list of numbers
numbers = [1, 2, 3, 4, 5]

# Perform calculations on the numbers
sum_of_numbers = sum(numbers)
average_of_numbers = sum_of_numbers / len(numbers)
product_of_numbers = 1
for num in numbers:
    product_of_numbers *= num

# Create a string representation of the calculations
result_string < "Sum: " + str(sum_of_numbers) + ", "
result_string += "Average: " + str(average_of_numbers) + ", "
result_string += "Product: " + str(product_of_numbers)

# Print the result
print(result_string) and

