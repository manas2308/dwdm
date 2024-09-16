from itertools import permutations

def is_valid_solution(solution):
    # Unpack the solution into a dictionary
    letter_to_digit = dict(zip('SENDMORE', solution))
    
    # Convert words to numbers based on the current solution
    def to_number(word):
        return int(''.join(str(letter_to_digit[letter]) for letter in word))
    
    # Convert the words to numbers
    send = to_number('SEND')
    more = to_number('MORE')
    money = to_number('MONEY')
    
    # Check if the equation holds true
    return send + more == money

def solve_cryptarithm():
    # Define the unique letters in the problem
    letters = 'SENDMORE'
    
    # Generate all permutations of digits for these letters
    for perm in permutations(range(10), len(letters)):
        if is_valid_solution(perm):
            # If a valid solution is found, return it in a readable format
            letter_to_digit = dict(zip(letters, perm))
            return letter_to_digit
    
    return None

# Example usage
if __name__ == "__main__":
    solution = solve_cryptarithm()
    
    if solution:
        print("Solution found:")
        for letter, digit in solution.items():
            print(f"{letter}: {digit}")
    else:
        print("No solution found.")
