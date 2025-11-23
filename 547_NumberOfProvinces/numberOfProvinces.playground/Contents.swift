// This seems like adjancency Matrix
// Cause of below, this is counting the connected Components
// A province is a group of directly or indirectly connected cities and no other cities outside of the group.

/*
    // build a unidirectional graph
      i j
    [[1,1,0],[1,1,0],[0,0,1]]
    so if isConnected[i][j] == 1, add to graph
        {0: [1], 1: [0]}

        i j
    [[1,1,0],[1,1,0],[0,0,1]]
    so if isConnected[i][j] == 1, add to graph
        {0: [1], 1: [0]}

              i j
    [[1,1,0],[1,1,0],[0,0,1]]
    so if isConnected[i][j] == 1, add to graph
        {0: [1], 1: [0]}

                i j
    [[1,1,0],[1,1,0],[0,0,1]]
    so if isConnected[i][j] == 1, add to graph
        {0: [1], 1: [0]}

                      i j
    [[1,1,0],[1,1,0],[0,0,1]]
    so if isConnected[i][j] == 1, add to graph
        {0: [1], 1: [0]}

                        i j
    [[1,1,0],[1,1,0],[0,0,1]]
    so if isConnected[i][j] == 1, add to graph
        {0: [1], 1: [0]}

    var ans = 0
    var seen = {}

    dfs(0)
        seen = {0}
        go through graph[0] neigbor -> [1]
            if not in seen,
                add it to seen -> {0,1}
                traverse it -> dfs {1}

    dfs(1)
        seen = {0,1}
        go through graph[0] neigbor -> [0]
            if not in seen,
                add it to seen -> {0,1}
                traverse it -> dfs {1}

    dfs(2)
        seen = {0,1}
        go through graph[0] neigbor -> []
            if not in seen,
                add it to seen -> {0,1,2}
                traverse it -> dfs {1}

    var graph
    for i in 0..<isConnected.count {
        for j in i+1..<isConnected.count{
            if isConnteted[i][j] == 1 {
                graph[vertix].append(edge)
                graph[vertix].append(edge)
            }
        }
    }

    when dfs return ended, we have found one province

    var seen = Set<Int>

     i in loop though 0..<n
        ans += 1
        seen.insert(i)
        dfs(i)

    return dfs
*/

// 💡 In adjacency matrix, you can't iterate only over edges — you must scan all possible pairs.
// So creating a graph is o(n^2) and not o(n * e)
// DFS traversal is o(n + e) <= o(n ^ 2)
// Time: o(n^2)

// Space: o(n^2)
// Graph storage: adjacency list with at most n nodes and e ≤ n² edges → O(n + e) = O(n²) in worst case.
// set: o(n)
// DFS recursion stack: O(n) (max depth = n)
func findCircleNumNotSpaceOptimize(_ isConnected: [[Int]]) -> Int {
  // create graph
  var graph = [Int: [Int]]()
  for i in 0..<isConnected.count {
    for j in i+1..<isConnected.count {
      if isConnected[i][j] == 1 {
        graph[i, default: [ ]].append(j)
        graph[j, default: [ ]].append(i)
      }
    }
  }
  
  var seen = Set<Int>()
  func dfs(_ vertix: Int) {
    seen.insert(vertix)
    for neighbor in graph[vertix, default: [ ]] {
      if !seen.contains(neighbor) {
        seen.insert(neighbor)
        dfs(neighbor)
      }
    }
  }
  
  
  var ans = 0
  for i in 0..<isConnected.count {
    if !seen.contains(i) {
      ans += 1
      dfs(i)
    }
    
  }
  
  return ans
}

print(findCircleNumNotSpaceOptimize([[1,1,0],[1,1,0],[0,0,1]]))
print(findCircleNumNotSpaceOptimize([[1,0,0],[0,1,0],[0,0,1]]))
