from collections import deque

def bfs(graph, start):
    visited = set()      # Set to keep track of visited nodes
    queue = deque([start])  # Initialize queue with the start node

    while queue:
        vertex = queue.popleft()  # Dequeue a vertex from the queue
        if vertex not in visited:
            visited.add(vertex)  # Mark the node as visited
            print(vertex, end=' ')  # Process the node (e.g., print it)
            # Enqueue all adjacent nodes that have not been visited
            queue.extend(neighbor for neighbor in graph[vertex] if neighbor not in visited)

# Example usage
if __name__ == "__main__":
    # Define the graph using an adjacency list
    graph = {
        'A': ['B', 'C'],
        'B': ['A', 'D', 'E'],
        'C': ['A', 'F'],
        'D': ['B'],
        'E': ['B', 'F'],
        'F': ['C', 'E']
    }
    
    print("BFS traversal starting from vertex 'A':")
    bfs(graph, 'A')
