/*
    the question is asking that ditance from nearest zero, so when we see a cell 1 that is next to zero... that is 1 away from zero... then we go to the neighboring cell of 1st, and that is 2 distance away

    func isValid(row, col) -> Bool
        if within boundary and mat[row][col] == 1

    So i need to for loop through ro
        for loop through col
            if cell is == 0
                add it to the queue (row, col, step)
                add it to seen, (row, col)
    queue = [(0,0,1), (0,1,1), (0,2,1), (1,0,1), (1,2,1)]
    seen = [(0,0), (0,1), (0,2), (1,0), (1,2)]

    copyMate = mate

    let directions = [up, down, left, right]

    then while queeu is not empty, // do BFS
        let (row, col, step) = dqueue
        for direction in diretions {
            let newRow
            let newCOl
            if isValid and not in seen {
                add it to seen
                enqueue it (newRpw, newCOl, step + 1)
                copyMate[newRow][newCol] = step
            }
        }
    }
    queue = [(0,0,1), (0,1,1), (0,2,1), (1,0,1), (1,2,1)] -> dequeu => (0,0,1)
    queue = [(0,1,1), (0,2,1), (1,0,1), (1,2,1)] --> look in all direction --> nothing valid

    queue = [(0,1,1), (0,2,1), (1,0,1), (1,2,1)] -> dequeu => (0,1,1)
    queue = [(0,2,1), (1,0,1), (1,2,1)] --> look in all direction --> one valid down and not in seen
        so, add it to see
        enqueue it with updated step
        update mate with step
    queue = [(0,2,1), (1,0,1), (1,2,1),(1,1,2)]
    
   queue = [(0,2,1), (1,0,1), (1,2,1),(1,1,2)]  -> dequeu => (0,2,1)
    queue = [(1,0,1), (1,2,1), (1,1,2)] --> not valid

    queue = [(1,0,1), (1,2,1), (1,1,2)]  -> dequeu => (1,0,1)
    queue = [(1,2,1), (1,1,2)] --> valid --> queue [(1,2,1), (1,1,2)(2,0,2)]

    queue = [(1,2,1), (1,1,2), (2,0,2)]  -> dequeu => (1,2,1)
    queue = [(1,1,2), (2,0,2)] --> valid --> queue [(1,1,2), (2,0,2), (2,2,1)]
    
    queue = [(1,1,2), (2,0,2), (2,2,1)]  -> dequeu => (1,1,2), down is valid
    queue = [(2,0,2), (2,2,1)] --> valid --> queue [(2,0,2), (2,2,1), (1,2,3)]

    // the maze is technically done and upfrade
*/
// Time: o(n * m)
// Space: o(n * m)
func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
  var copyMat = mat
  func isValid(_ row: Int, _ col: Int) -> Bool {
    row >= 0 && row < copyMat.count && col >= 0 && col < copyMat[0].count && copyMat[row][col] == 1
  }
  
  let directions = [(row: 0, col: 1), (row: 1, col: 0), (row: 0, col: -1), (row: -1, col: 0)]
  
  var queue = [(Int, Int, Int)]()
  var seen = Set<[Int]>()
  
  for row in 0..<mat.count {
    for col in 0..<mat[row].count {
      if mat[row][col] == 0 {
        queue.append((row, col, 1))
        seen.insert([row, col])
      }
    }
  }
  
  // BFS
  while !queue.isEmpty {
    let (row, col, step) = queue.removeFirst()
    for direction in directions {
      let newRow = row + direction.row
      let newCol = col + direction.col
      if isValid(newRow, newCol) && !seen.contains([newRow, newCol]) {
        queue.append((newRow, newCol, step + 1))
        seen.insert([newRow, newCol])
        copyMat[newRow][newCol] = step
      }
    }
  }
  
  return copyMat
}

print(updateMatrix([[0,0,0],[0,1,0],[0,0,0]]))
print(updateMatrix([[0,0,0],[0,1,0],[1,1,1]]))
