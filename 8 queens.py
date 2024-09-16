def print_board(board):
    for row in board:
        print(" ".join("Q" if cell else "." for cell in row))
    print()

def is_safe(board, row, col):
    # Check column
    for i in range(row):
        if board[i][col]:
            return False

    # Check left diagonal
    for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
        if board[i][j]:
            return False

    # Check right diagonal
    for i, j in zip(range(row, -1, -1), range(col, len(board))):
        if board[i][j]:
            return False

    return True

def solve(board, row):
    if row >= len(board):
        return True

    for col in range(len(board)):
        if is_safe(board, row, col):
            board[row][col] = True
            if solve(board, row + 1):
                return True
            board[row][col] = False

    return False

def eight_queens():
    size = 8
    board = [[False] * size for _ in range(size)]
    if solve(board, 0):
        print_board(board)
    else:
        print("No solution exists")

# Run the program
eight_queens()
