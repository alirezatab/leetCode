/*

    [0,0,1,0,0,0,0,1,0,0,0,0,0],
    [0,0,0,0,0,0,0,1,1,1,0,0,0],
    [0,1,1,0,1,0,0,0,0,0,0,0,0],
    [0,1,0,0,1,1,0,0,1,0,1,0,0],
    [0,1,0,0,1,1,0,0,1,1,1,0,0],
    [0,0,0,0,0,0,0,0,0,0,1,0,0],
    [0,0,0,0,0,0,0,1,1,1,0,0,0],
    [0,0,0,0,0,0,0,1,1,0,0,0,0]

    var maxIslanArea = 0

    isValidMove
        checkBoundary and if gird[row][col] == 1

    let directions -> [(row,col)]
    dfs(row, col) -> Int
        islandSize = 1
        loop through direction in directions
            let newRow = row + direction.row
            let newCol = col + direction.col
            if isVld(newRow, Newcol) && not in seen or use a girdCopy {
                islandSize += dfs(newRow, newCol)
            }
        return islandSize

    need to traverse the grid
    so loop through row
        loop through col
            if grid[row][col] == 1 {
                // add the max of max or 1
                max (Max, dfs(row, col))
            }
*/
// Time: (R * c)
// Space: (R * C)
// copyGrid: You make a mutable copy of the input → O(R × C) space.
// In the worst case (e.g., the entire grid is land and shaped like a snake), the recursion depth could be R × C
func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
  var copyGrid = grid
  var maxIsalndSize = 0
  var rCount = grid.count
  var cCount = grid[0].count
  
  func isValid(_ row: Int, _ col: Int) -> Bool {
    row >= 0 && row < rCount && col >= 0 && col < cCount && copyGrid[row][col] == 1
  }
  
  let directions = [(row: 1, col: 0), (row: 0, col: 1), (row: -1, col: 0), (row: 0, col: -1)]
  func dfs(_ row: Int, _ col: Int) -> Int {
    copyGrid[row][col] = 0
    var islandSize = 1
    for direction in directions {
      let newRow = row + direction.row
      let newCol = col + direction.col
      if isValid(newRow, newCol) {
        islandSize += dfs(newRow, newCol)
      }
    }
    return islandSize
  }
  
  for row in 0..<rCount {
    for col in 0..<cCount {
      if copyGrid[row][col] == 1 {
        maxIsalndSize = max(maxIsalndSize, dfs(row, col))
      }
    }
  }
  
  return maxIsalndSize
}

print(maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]))
print(maxAreaOfIsland([[0,0,0,0,0,0,0,0]]))
