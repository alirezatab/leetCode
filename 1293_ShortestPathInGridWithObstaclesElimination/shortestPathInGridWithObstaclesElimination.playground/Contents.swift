/*
// shorted path so do BFS     (0,0,1,0)
start from 0,0 so add queue = [(0,0, K, step)], seen = [[0,0]]

isValid(row, col) -> Bool
    within Boundary

let directions, up, dow, left and right
while queue is not empty
    let (row, col, remaining, step) = dqueue
    
    if row is end and col is at end, return step
    
    for direction in directions
        let newRow
        let newCol
        if isValid and not in seen
            if maze[newRow][newCol] == 0
                enqueue(newRow, newCol, remaining, step + 1)
                seen.insert([newRowl, newCOl])
            else if remaining > 0
                enqueue(newRow, newCol, remaining - 1, step + 1)
                seen.insert([newRowl, newCOl])


[0,0,0] queue = [(0,0,1,0)], seen = [[0,0]]
[1,1,0]     valid directions are right and down
[0,0,0]     queue = [(0,0,1,0)], seen = [[0,0]] --> dequeue = (0,0,1,0)
[0,1,1]     queue = [], seen = [[0,0]] --> is valid and nt in seen, enque  -> queueu = [(0,1,1,1), (1,0,0,1)], seen = [[0,0], [0,1], [1,0]]
[0,0,0]

[s,s,0] queueu = [(0,1,1,1), (1,0,0,1)], seen = [[0,0], [0,1], [1,0]] -> dequeue = (0,1,1,1)
[s,1,0] queueu = [(1,0,0,1)] -> valid moves are down, right so...
[0,0,0] --> enqueue --> queueu = [(1,0,0,1), (0,2,1,2), (1,1,0,2)], seen = [[0,0], [0,1], [1,0], [0,2], [1,1]]
[0,1,1]
[0,0,0]

[s,s,s] queueu = [(1,0,0,1), (0,2,1,2), (1,1,0,2)], seen = [[0,0], [0,1], [1,0], [0,2], [1,1]] -> dequeue = (1,0,0,1)
[s,s,0] queueu = [(0,2,1,2), (1,1,0,2)] -> valid moves are down, so...
[s,0,0] --> enqueue --> queueu = [(0,2,1,2), (1,1,0,2), (2,0,0,2)], seen = [[0,0], [0,1], [1,0], [0,2], [1,1], [2,0]]
[0,1,1]
[0,0,0]

[s0,s0,s0] queueu = [(0,2,1,2), (1,1,0,2), (2,0,0,2)], seen = [[0,0], [0,1], [1,0], [0,2], [1,1], [2,0]] -> dequeue = (0,2,1,2)
[s1,s1,0] queueu = [(1,1,0,2), (2,0,0,2)] -> valid moves are down, so...
[s0,0,0] --> enqueue --> queueu = [(0,2,1,2), (1,1,0,2), (2,0,0,2)], seen = [[0,0], [0,1], [1,0], [0,2], [1,1], [2,0]]
[0,1,1]
[0,0,0]
*/

// Time: O(M * N * K) — each cell can be visited with up to K+1 different remaining obstacle counts
// Space: O(M * N * K) — 'seen' stores states as (row, col, remaining)

func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
  func isValid(_ row: Int, _ col: Int) -> Bool {
    row >= 0 && row < grid.count && col >= 0 && col < grid[row].count
  }
  
  var queue = [(0,0,k,0)]
  var seen: Set<[Int]> = [[0,0,k]]
  
  let directions = [(row: 0, col:1), (row: 1, col: 0), (row: 0, col:-1), (row: -1, col: 0)]
  
  while !queue.isEmpty {
    let (row, col, remaining, step) = queue.removeFirst()
    
    if row == grid.count - 1 && col == grid[row].count - 1 { return step }
    
    for direction in directions {
      let newRow = row + direction.row
      let newCol = col + direction.col
      
      // my way, not valid cause when zero, we check seen with remining
      // when not zerop, we check seen with remining - 1
      // if isValid(newRow, newCol) && !seen.contains([newRow,newCol,remaining]) {
      //     if grid[newRow][newCol] == 0 {
      //         queue.append((newRow, newCol, remaining, step + 1))
      //         seen.insert([newRow, newCol, remaining])
      //     } else if remaining > 0 {
      //         queue.append((newRow, newCol, remaining - 1, step + 1))
      //         seen.insert([newRow, newCol, remaining - 1])
      //     }
      // }
      
      if isValid(newRow, newCol) {
        if grid[newRow][newCol] == 0 {
          if !seen.contains([newRow,newCol,remaining]) {
            queue.append((newRow, newCol, remaining, step + 1))
            seen.insert([newRow, newCol, remaining])
          }
        } else if remaining > 0 && !seen.contains([newRow,newCol,remaining - 1]) {
          queue.append((newRow, newCol, remaining - 1, step + 1))
          seen.insert([newRow, newCol, remaining - 1])
        }
      }
    }
  }
  
  return -1
}

print(shortestPath([[0,0,0],[1,1,0],[0,0,0],[0,1,1],[0,0,0]], 1))
print(shortestPath([[0,1,1],[1,1,1],[1,0,0]], 1))
print(shortestPath([[0,0,1,0,0,0,0,1,0,1,1,0,0,1,1],[0,0,0,1,1,0,0,1,1,0,1,0,0,0,1],[1,1,0,0,0,0,0,1,0,1,0,0,1,0,0],[1,0,1,1,1,1,0,0,1,1,0,1,0,0,1],[1,0,0,0,1,1,0,1,1,0,0,1,1,1,1],[0,0,0,1,1,1,0,1,1,0,0,1,1,1,1],[0,0,0,1,0,1,0,0,0,0,1,1,0,1,1],[1,0,0,1,1,1,1,1,1,0,0,0,1,1,0],[0,0,1,0,0,1,1,1,1,1,0,1,0,0,0],[0,0,0,1,1,0,0,1,1,1,1,1,1,0,0],[0,0,0,0,1,1,1,0,0,1,1,1,0,1,0]], 27))
