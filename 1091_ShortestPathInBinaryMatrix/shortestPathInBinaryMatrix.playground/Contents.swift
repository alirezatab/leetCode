/*
    [  c0 c1 c2     grid[0][0] = 1
 r0   [0, 0 ,0],    queue = [0][0], while queue not empty
 r1   [1, 1, 0],        box = deque
 r2   [1, 1, 0]         find all the valid neighbors
    ]

     [ c0 c1 c2
 r0   [1, 2 ,0],    queue = [0][0], while queue not empty
 r1   [1, 1, 0],        box = deque
 r2   [1, 1, 0]         find all the valid neighbors ->[0][1]
                                                -> add that to queue, update value to 2
    ]
     [ c0 c1 c2
 r0   [1, 2 ,3],    queue = [0][1], while queue not empty
 r1   [1, 1, 3],        box = deque
 r2   [1, 1, 0]        lopp through all the valid neighbors -> add that to queue,
                                                    [[0][2], [1][2] update value to 3
    [ c0 c1 c2
 r0   [1, 2 ,3],    queue = [0][2], while queue not empty
 r1   [1, 1, 3],        box = deque
 r2   [1, 1, 4]        lopp through all the valid neighbors -> add that to queue,
                                                    update value if value == 0
                                                    [[1][2] update value to


*/

// shorted path == BFS better
// no path, return -1
// from (0,0) to (n-1, n-1) --> top left to bottom rigth is a clear path.
// can only take paths that are 0s.
// vertical, horizontal and diagional == 8 moves are valid

/*

📌 Key Rule for BFS:
✅ Mark a node as visited when you enqueue it — not when you dequeue it.

queue = [0,0,1]
add to seen 0,0
     [ c0 c1 c2      while loop
 r0   [0, 0 ,0],        deque
                        if(n-1, n1) { return step}
 r1   [1, 1, 0],
 r2   [1, 1, 0]        loop through directions
                            if isValidDireftion and not in see
                                add to queue(newRow, NewCol, step + 1) -> (0,1,2)
                                add to seen
                                

                       c1 --> queue = [(0,2,3), (1,2,3)], seen == [(0,0,1), (0,0,1)]
                       c2 --> queue = [(1,2,3)], seen == [(0,0,1), (0,0,1), (0,2,3)]
                   r1, c2 --> queue = [(1,2,3)] -> [] -> [2,2,4], seen == [(0,0,1), (0,0,1), (0,2,3), (1,2,3)]


    check that gird[0][0] == 0 otherwise return -1
    create a isValid function that checks your inbout && the grid[row][col] == true --> return bool

    create a var for directions and all all 8 moves there
    var seen --> can be a grid where I mark that path to 1??? or the number of steps so that way value at end will be the shortest path
        --> or a set that I can add the visisted rows and cols in it as a String
        --> ask interviewer which they prefer? which is better to use and why. set has a overhead hashing but a but simpler to use mostly, Grid is less code but a bit more optimized for smaller matrix... in this case n is 100 x 100 only
    
    var for steps, I can either keep global and return the steps as soon as i get to the end.... if used in a grid, I can add it as a number to the grid..
    also can add it to the queue as a value
    need a queue - [(0,0,1)]
    update seen with 0,0
    while queue.isNotEmpty {
        deque
        if at end, return step
        add to seen

        let (row, col, step) = queue.deque() --> removeFirst()
            loop through directions
                if direction is valid and not in seen
                    add that to the queue
    }

*/
// Time: o(n^2) since in worst case, need to visit all the cells
// Space: o(n^2) since in worst case, need to visit all the cells
// MARK: - Using a set for seen
func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
  let n = grid.count
  guard grid[0][0] == 0, grid[n-1][n-1] == 0  else { return -1 }
  func isValid(_ row: Int, _ col: Int) -> Bool {
    row >= 0 && row < n && col >= 0 && col < n && grid[row][col] == 0
  }
  
  let directions = [(row: 0,col: 1), (row: 1,col: 0), (row: 0,col: -1), (row: -1,col: 0),
                    (row: -1,col: -1), (row: -1,col: 1), (row: 1,col: 1), (row: 1,col: -1)]
  
  var queue = [(0,0,1)]
  var seen: Set<String> = ["0,0"]
  
  while !queue.isEmpty {
    let (row, col, step) = queue.removeFirst()
    
    guard row != n - 1 || col != n - 1 else {
      return step
    }
    for direction in directions {
      let newRow = row + direction.row
      let newCol = col + direction.col
      if isValid(newRow, newCol) && !seen.contains("\(newRow),\(newCol)") {
        queue.append((newRow, newCol, step + 1))
        seen.insert("\(newRow),\(newCol)")
      }
    }
  }
  return -1
}

print(shortestPathBinaryMatrix([[0,1],[1,0]]))
print(shortestPathBinaryMatrix([[0,0,0],[1,1,0],[1,1,0]]))
print(shortestPathBinaryMatrix([[1,0,0],[1,1,0],[1,1,0]]))

// Same as above but with a bit of different style of coding
func shortestPathBinaryMatrixSameAsAbove(_ grid: [[Int]]) -> Int {
    var maxRow = grid.count - 1
    var maxCol = grid[0].count - 1
    guard grid[0][0] == 0, grid[maxRow][maxCol] == 0 else { return -1 }
    var visited = Set<String>()
    var queue: [(row: Int, col:Int, distance: Int)] = [(0, 0, 1)]
    visited.insert("0, 0")

    while !queue.isEmpty {
        var(row, col, distance) = queue.removeFirst()
        if row == maxRow && col == maxCol {
            return distance
        }
        for (row, col) in getValidNeighbors(grid, row: row, col: col) {
            guard !visited.contains("\(row), \(col)") else { continue }
            
            visited.insert("\(row), \(col)")
            queue.append((row, col, distance + 1))
        }
    }
    return -1
}


func getValidNeighbors(_ matrix: [[Int]], row: Int,  col: Int) -> [(row: Int, col:Int)] {
    var neighbors = [(row: Int, col: Int)]()
    var maxRow = matrix.count
    var maxCol = matrix[0].count
    var directions: [(row: Int, col:Int)] = [(-1, -1), (-1, 0), (-1, 1),
                                             (0, -1),           (0, 1),
                                             (1, -1),  (1, 0),  (1, 1)]
    for direction in directions {
        var nextRow = row + direction.row
        var nextCol = col + direction.col
    
        if nextRow < 0 || nextCol < 0 || nextRow >= maxRow ||
            nextCol >= maxCol || matrix[nextRow][nextCol] != 0 {
            continue
        }
        neighbors.append((nextRow, nextCol))
    }
    return neighbors
}

// MARK: - GlobalDistanceTracking
// Keeping track of how many cells at each distance are on the queue
// not overriting original
func shortestPathBinaryMatrixGlobalDistanceTracking(_ grid: [[Int]]) -> Int {
  var maxRow = grid.count - 1
  var maxCol = grid[0].count - 1
  guard grid[0][0] == 0, grid[maxRow][maxCol] == 0 else { return -1 }
  
  // Set up the BFS.
  var queue = [(row: 0, col: 0)]
  var visited = Array(repeating: Array(repeating: false, count: grid[0].count),
                      count: grid.count)
  visited[0][0] = true
  var curDistance = 1
  
  while !queue.isEmpty {
    for i in 0..<queue.count {
      let (row, col) = queue.removeFirst()
      if (row, col) == (maxRow, maxCol) {
        return curDistance
      }
      for (row, col) in getValidNeighbors(grid, row: row, col: col) {
        if visited[row][col] {
          continue
        }
        
        visited[row][col] = true
        queue.append((row, col))
      }
    }
    
    curDistance += 1
  }
  return -1
}

print(shortestPathBinaryMatrixGlobalDistanceTracking([[0,1],[1,0]]))
print(shortestPathBinaryMatrixGlobalDistanceTracking([[0,0,0],[1,1,0],[1,1,0]]))
print(shortestPathBinaryMatrixGlobalDistanceTracking([[1,0,0],[1,1,0],[1,1,0]]))

// MARK: - Using Matrix seen and final result
func shortestPathBinaryMatrixUpdatingMatrix(_ grid: [[Int]]) -> Int {
  var maxRow = grid.count - 1
  var maxCol = grid[0].count - 1
  guard grid[0][0] == 0, grid[maxRow][maxCol] == 0 else { return -1 }
  var matrix = grid
  
  var queue: [(row: Int, col:Int)] = [(0, 0)]
  matrix[0][0] = 1
  
  while !queue.isEmpty {
    var(row, col) = queue.removeFirst()
    var distance = matrix[row][col]
    if row == maxRow && col == maxCol {
      return distance
    }
    for neighbor in getValidNeighbors(matrix, row: row, col: col) {
      queue.append((neighbor.row, neighbor.col))
      matrix[neighbor.row][neighbor.col] = distance + 1
    }
  }
  
  return -1
}

print(shortestPathBinaryMatrixUpdatingMatrix([[0,1],[1,0]]))
print(shortestPathBinaryMatrixUpdatingMatrix([[0,0,0],[1,1,0],[1,1,0]]))
print(shortestPathBinaryMatrixUpdatingMatrix([[1,0,0],[1,1,0],[1,1,0]]))
    

// using two queues to keep track of layering
// AKA Starting a new collection for each distance
// + global distance tracking
func shortestPathBinaryMatrixTwoQueuesLayering(_ grid: [[Int]]) -> Int {
  var maxRow = grid.count - 1
  var maxCol = grid[0].count - 1
  guard grid[0][0] == 0, grid[maxRow][maxCol] == 0 else { return -1 }
  
  // Set up the BFS.
  var currentLayer = [(row: 0, col: 0)]
  var nextLayer = [(row: Int, col: Int)]()
  var visited: Set<String> = ["\((0, 0))"]
  var curDistance = 1
  
  while !currentLayer.isEmpty {
    
    for (row, col) in currentLayer {
      if (row, col) == (maxRow, maxCol) {
        return curDistance
      }
      for neighbor in getValidNeighbors(grid, row: row, col: col) {
        if visited.contains("\(neighbor)") {
          continue
        }
        
        visited.insert("\(neighbor)")
        nextLayer.append(neighbor)
      }
    }
    
    curDistance += 1
    currentLayer = nextLayer
    nextLayer = []
  }
  return -1
}

print(shortestPathBinaryMatrixTwoQueuesLayering([[0,1],[1,0]]))
print(shortestPathBinaryMatrixTwoQueuesLayering([[0,0,0],[1,1,0],[1,1,0]]))
print(shortestPathBinaryMatrixTwoQueuesLayering([[1,0,0],[1,1,0],[1,1,0]]))

// MARK: - Not ideal for shorted path, DFS is better for all paths
func shortestPathBinaryMatrixDFS(_ grid: [[Int]]) -> Int {
  var maxX = grid.count - 1
  var maxY = grid[0].count - 1
  guard grid[0][0] == 0, grid[maxX][maxY] == 0 else { return -1 }
  
  var visited = Array(repeating: Array(repeating: false, count: grid[0].count),
                      count: grid.count)
  
  
  // Define all 8 possible movements (up, down, left, right, and diagonals)
  let directions = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
  
  func traverseDFS(x: Int, y: Int, pathLength: Int) -> Int {
    // If out of bounds or the cell is blocked or already visited
    if x < 0 || x > maxX || y < 0 || y > maxY || grid[x][y] == 1 || visited[x][y]  {
      return Int.max
    }
    
    // If reached the bottom-right corner, return the path length
    if x == maxX && y == maxY {
      return pathLength
    }
    
    visited[x][y] = true
    
    var shortest = Int.max
    for direction in directions {
      let newX = x + direction.0
      let newY = y + direction.1
      let currentPathLength = traverseDFS(x: newX, y: newY, pathLength: pathLength + 1)
      shortest = min(shortest, currentPathLength)
    }
    
    // BackTrack
    visited[x][y] = false
    return shortest
  }
  
  let result = traverseDFS(x: 0, y: 0, pathLength: 1)
  return result == Int.max ? -1 : result
}

print(shortestPathBinaryMatrixDFS([[0,1],[1,0]]))
print(shortestPathBinaryMatrixDFS([[0,0,0],[1,1,0],[1,1,0]]))
print(shortestPathBinaryMatrixDFS([[1,0,0],[1,1,0],[1,1,0]]))
