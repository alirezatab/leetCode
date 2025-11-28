// Time: o(n^2)
// Space: o(n^2)
func snakesAndLadders(_ board: [[Int]]) -> Int {
  let n = board.count
  var cells = Array<(Int, Int)>(repeating: (0,0), count: n * n + 1)
  var label = 1
  var columns = Array(0..<n)
  
  for row in stride(from: n - 1, through: 0, by: -1) {
    for col in columns {
      cells[label] = (row, col)
      label += 1
    }
    columns.reverse()
  }
  
  var dist = Array(repeating: -1, count: n * n + 1)
  
  var queue = [1]
  dist[1] = 0
  
  while !queue.isEmpty {
    let cur = queue.removeFirst()
    
    // more optimized if I put it at the bottom
    // if let finalDist = dist.last, finalDist > -1 {
    //     return finalDist
    // }
    
    if cur >= n * n { continue }
    
    // this for loop uses the dice role, so ... if you have cur == 5.
    // and so the next numbers acan be from 6...11.
    //if we have a 4x4 matrix, then max number is 16
    // but if you are at cell 14 or 15, you can only do 14...16 which
    // is the minimum of (n * n) cause cur + 6
    // would be bigger than the board
    for next in cur + 1...min(cur + 6, n * n) {
      let (row, col) = cells[next]
      let destination  = board[row][col] != -1 ? board[row][col] : next // so this is foe either seeing ladder or seeing -1, if -1, go to dice roll next,
      
      // path not taken??
      if dist[destination] == -1 {
        dist[destination] = dist[cur] + 1 // sp steps added to dist[destination]
        if destination == n * n {
          return dist[destination]
        }
        queue.append(destination)
      }
    }
  }
  
  return dist[n * n]
}
