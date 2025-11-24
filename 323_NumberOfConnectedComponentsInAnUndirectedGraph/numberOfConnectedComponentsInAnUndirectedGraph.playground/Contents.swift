/*
    create a hash graph
    {0: [1], 1:[0, 2], 2: [1], 3: [4], 4:[3]}
    
    dfs(0)
        seen = {0}, [1]
    dfs(1)
        seen = {0, 1}, [0,2]
    dfs(2)
        seen = {0,1,2} [1]

    var seen
    var ans =
    dfs node
        seen.insert(node)   {0}
        get the neighbor in neighbors
            if not in seen {
                dfs(neighbor)
            }


    for i in 0..< n {
        if i not in seen
            ans += 1
            dfs(i)
    }
*/

// Space: o(V + E),
// graph: Stores all vertices and edges → O(V + E)
    //(Each undirected edge appears twice, so total edge storage is 2E → still O(E))
// seen set: At most V elements → O(V)
// DFS recursion stack:
    // In the worst case (e.g., a linear chain like 0–1–2–…–(V−1)), the depth is V, not E.
    // The stack stores vertices, not edges.
    // → O(V), not O(E)
func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
  var seen = Set<Int>()
  var graph = [Int: [Int]]()
  for edge in edges {
    graph[edge[0], default: [ ]].append(edge[1])
    graph[edge[1], default: [ ]].append(edge[0])
  }
  
  func dfs(_ vertix: Int) {
    seen.insert(vertix)
    for neighbor in graph[vertix, default: [ ]] {
      if !seen.contains(neighbor) {
        dfs(neighbor)
      }
    }
  }
  
  var ans = 0
  for i in 0..<n {
    if !seen.contains(i) {
      ans += 1
      dfs(i)
    }
  }
  
  return ans
}

print(countComponents(5, [[0,1],[1,2],[3,4]]))
print(countComponents(5, [[0,1],[1,2],[2,3],[3,4]]))
