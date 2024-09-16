import heapq

class PuzzleState:
    def __init__(self, board, path=''):
        self.board = board
        self.path = path
        self.blank_pos = board.index(0)  # Index of the empty space
        self.size = int(len(board) ** 0.5)  # Size of the board (3 for 8-puzzle)
        self.goal = list(range(1, len(board))) + [0]

    def is_goal(self):
        return self.board == self.goal

    def get_neighbors(self):
        neighbors = []
        x, y = divmod(self.blank_pos, self.size)
        moves = [(0, 1), (0, -1), (1, 0), (-1, 0)]  # Right, Left, Down, Up
        for move in moves:
            nx, ny = x + move[0], y + move[1]
            if 0 <= nx < self.size and 0 <= ny < self.size:
                new_blank_pos = nx * self.size + ny
                new_board = list(self.board)
                new_board[self.blank_pos], new_board[new_blank_pos] = new_board[new_blank_pos], new_board[self.blank_pos]
                neighbors.append(PuzzleState(new_board, self.path + str(new_blank_pos)))
        return neighbors

    def __lt__(self, other):
        return (self.path_length() + self.heuristic()) < (other.path_length() + other.heuristic())

    def path_length(self):
        return len(self.path)

    def heuristic(self):
        return sum(abs((val // self.size - i // self.size) + (val % self.size - i % self.size)) for i, val in enumerate(self.board) if val != 0)

def a_star(start_state):
    open_list = []
    closed_set = set()
    heapq.heappush(open_list, start_state)
    
    while open_list:
        current = heapq.heappop(open_list)
        if current.is_goal():
            return current.path
        
        closed_set.add(tuple(current.board))
        for neighbor in current.get_neighbors():
            if tuple(neighbor.board) in closed_set:
                continue
            heapq.heappush(open_list, neighbor)
    
    return None

# Define the initial state of the board (flattened)
initial_board = [1, 2, 3, 4, 5, 6, 7, 8, 0]

# Create the initial state
initial_state = PuzzleState(initial_board)

# Solve the puzzle
solution_path = a_star(initial_state)

if solution_path is not None:
    print(f"Solution found in {len(solution_path)} moves: {solution_path}")
else:
    print("No solution exists")
