/*
    let m = maze.count
    let n = maze[0].count
    isValid(row, col) -> bool... if within the boundary of maze and maze[r][col] == "."

    isExit(row, col) ==> row == 0 || col == 0 || row == m - 1 || col == n - 1

    directions in up down, left and right
    do a BFS
    queue (row, col, step) = (entrance[0], entance[1], 0)
    seen of entrace first

    while queue.not Empty
        deque
        check if exits, if so, return step
        for direction in directions
            calc newRow
            calc newCOl
            if is in valid and not seen
                append(newRow, newCol, step +1)
                add to seen

entrance = 1,2 --> queue = [(1,2,0)], seen = [(1,2)]
["+","+","S","+"] queue  = [] --> newRow, newCol --> queue = [(1,1,1), (0,2,1)], add it to seen
[".","S","s","+"]
["+","+","+","."]

queue = [(1,1,1), (0,2,1)], seen = [(1,2), (1,1), (0,2)]
["+","+","S","+"] queue deque = [1,1,1] --> newRow, newCol --> queue = [(0,2,1), (2,0,2)], add it to seen --> [(1,2), (1,1), (0,2), (2,0)]
[".","S","s","+"]
["+","+","+","."]
queue deque = [0,2,1] --> newRow, newCol --> queue = [(0,2,1), (2,0,2)], add it to seen --> [(1,2), (1,1), (0,2), (2,0)]
*/

// Time: o(N * M) since in worst case, there is no walls and you started somewMere in the middle, so you need to visit almost every cell
// Space: o(N * M) since in the worst case, our set will grow to have every node

func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
  let totalRows = maze.count - 1
  let totalCols = maze[0].count - 1
  
  func isValid(_ row: Int, _ col: Int) -> Bool {
    row >= 0 && row <= totalRows && col >= 0 && col <= totalCols && maze[row][col] == "."
  }
  
  func isExit(_ row: Int, _ col: Int) -> Bool {
    (row == 0 || col == 0 || row == totalRows || col == totalCols) &&
    (row != entrance[0] || col != entrance[1])
  }
  
  let directions = [(row: 0, col: 1), (row: 1, col: 0), (row: 0, col: -1), (row: -1, col: 0)]
  
  var queue = [(entrance[0], entrance[1], 0)]
  
  //var seen: Set<String> = ["\(entrance[0]),\(entrance[1])"]
  var seen: Set<[Int]> = [entrance] // more optimized if using array direction
  
  while !queue.isEmpty {
    let (row, col, step) = queue.removeFirst()
    if isExit(row, col) { return step }
    for direction in directions {
      let newRow = row + direction.row
      let newCol = col + direction.col
      
      // more optimized if using array direction
      if isValid(newRow, newCol) && !seen.contains([newRow, newCol]) {
        queue.append((newRow, newCol, step + 1))
        seen.insert([newRow, newCol])
      }
      // if isValid(newRow, newCol) && !seen.contains("\(newRow),\(newCol)") {
      //     queue.append((newRow, newCol, step + 1))
      //     seen.insert("\(newRow),\(newCol)")
      // }
    }
  }
  return -1
}

print(nearestExit([["+","+",".","+"],[".",".",".","+"],["+","+","+","."]], [1,2]))
print(nearestExit([["+","+","+"],[".",".","."],["+","+","+"]], [1,0]))
print(nearestExit([[".","+"]], [0,0]))
