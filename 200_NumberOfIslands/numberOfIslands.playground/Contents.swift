/*
    check if it is a valid island, so then you can traverse in dfs
    --> so create isValid func

    create a direction

    var seen set of row col
    traverse the graph in dfs
        insert row col in seen
        loop throguh directions
            figure out the new row and col based on the direction
            if newRow and col is valid, and not in seen
                dfs(newRow, newCol)

    ans = 0
    loop through row
        loop through col
            if gird[row][col] == 1 && not in seen
                inc ans
                dfs(row, col)
        
*/
// Time: o(n * m) cause to traverse the matrix, need to visit everuthing

// Space: o(n * m)
//for seen, and dfs... seen == (n * m) since in worse case, everything is 1 and so we store everything in seen,
//dfs at worse, everything is a 1, so (n * n)

// can save sapce by updating the grid if we use in out.... but not recommendad by apple

func numIslands(_ grid: [[Character]]) -> Int {
  func isValid(_ row: Int, _ col: Int) -> Bool {
    return row >= 0 && row < grid.count &&
    col >= 0 && col < grid[row].count &&
    grid[row][col] == "1"
  }
  
  let directions = [ (row: 0, col: 1), (row: 1, col: 0), (row: 0, col: -1), (row: -1, col: 0) ]
  var seen = Set<String>()
  // tranverse the grap
  func dfs(_ row: Int,_ col: Int) {
    seen.insert("\(row),\(col)")
    for (dRow, dCol) in directions {
      let nextRow = row + dRow
      let nextCol = col + dCol
      if isValid(nextRow, nextCol) && !seen.contains("\(nextRow),\(nextCol)") {
        dfs(nextRow, nextCol)
      }
    }
    
  }
  
  var ans = 0
  for row in 0..<grid.count {
    for col in 0..<grid[row].count {
      if grid[row][col] == "1" && !seen.contains("\(row),\(col)") {
        ans += 1
        dfs(row, col)
      }
    }
  }
  
  return ans
}

print(numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]))
print(numIslands([["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]))
