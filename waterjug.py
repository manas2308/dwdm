from collections import deque

def water_jug_solver(capacity_a, capacity_b, target):
    # State: (amount in jug A, amount in jug B)
    initial_state = (0, 0)
    visited = set()
    queue = deque([(initial_state, [])])
    
    while queue:
        (a, b), path = queue.popleft()
        
        # If we have reached the target
        if a == target or b == target:
            return path + [(a, b)]
        
        if (a, b) in visited:
            continue
        
        visited.add((a, b))
        
        # Possible moves
        moves = [
            (capacity_a, b),  # Fill jug A
            (a, capacity_b),  # Fill jug B
            (0, b),           # Empty jug A
            (a, 0),           # Empty jug B
            (a - min(a, capacity_b - b), b + min(a, capacity_b - b)),  # Pour A to B
            (a + min(b, capacity_a - a), b - min(b, capacity_a - a))   # Pour B to A
        ]
        
        for move in moves:
            if move not in visited:
                queue.append((move, path + [(a, b)]))
    
    return None

# Example usage
if __name__ == "__main__":
    capacity_a = 4  # Capacity of Jug A
    capacity_b = 3  # Capacity of Jug B
    target = 2      # Target amount of water to measure
    
    solution = water_jug_solver(capacity_a, capacity_b, target)
    
    if solution:
        print("Solution path:")
        for state in solution:
            print(f"Jug A: {state[0]}, Jug B: {state[1]}")
    else:
        print("No solution found.")
