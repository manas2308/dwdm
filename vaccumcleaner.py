class VacuumCleaner:
    def __init__(self, grid):
        self.grid = grid
        self.size = len(grid)
        self.position = (0, 0)  # Starting position
        self.directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]  # Right, Down, Left, Up

    def print_grid(self):
        for row in self.grid:
            print(' '.join('D' if cell == 1 else 'C' for cell in row))
        print()

    def is_dirty(self, position):
        x, y = position
        return self.grid[x][y] == 1

    def clean(self):
        x, y = self.position
        self.grid[x][y] = 0  # Clean the current position
        print(f'Cleaned position {self.position}')

    def move(self, direction):
        x, y = self.position
        dx, dy = direction
        new_position = (x + dx, y + dy)
        if 0 <= new_position[0] < self.size and 0 <= new_position[1] < self.size:
            self.position = new_position
            print(f'Moved to position {self.position}')
        else:
            print('Move out of bounds')

    def run(self):
        cleaned_positions = set()
        while len(cleaned_positions) < self.size * self.size:
            x, y = self.position
            if self.is_dirty(self.position):
                self.clean()
                cleaned_positions.add(self.position)
            # Try all directions to find a move
            moved = False
            for direction in self.directions:
                next_position = (x + direction[0], y + direction[1])
                if (0 <= next_position[0] < self.size and 0 <= next_position[1] < self.size and 
                    next_position not in cleaned_positions):
                    self.move(direction)
                    moved = True
                    break
            if not moved:
                print('No more moves available, terminating.')
                break
            self.print_grid()

# Define the grid: 1 represents dirt, 0 represents clean
grid = [
    [1, 0, 0],
    [0, 1, 0],
    [0, 0, 1]
]

vacuum = VacuumCleaner(grid)
vacuum.print_grid()
vacuum.run()
