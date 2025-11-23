/*
    great graph using hasmap
    {0:[1,2], 1:[0,2], 2:[1,0]}
    
    set for seen
    dfs thorugh the gird -> Bool
        if the destination == vertix that was passed in
            return true
        seen.add(vertix)
        for neighbor in grid[vertix]
            if nieghbor not n sem
                if do dfs again is true
                    return true
            
        return false
    return dfs(starts from source)
    
dfs(0)
    is 0 == 2, no
    seen = {0}                        *
    loop throug vertix neighbors --> [1,2]
        if nieghbor not n sem
            if dfs(neighbor) {
                reutrn true
            }

dfs(1) -> true
    is 1 == 2, no
    seen = {0, 1}                     *
    loop throug vertix neighbors --> [0,2]
        if nieghbor not n sem (it is in seen, so we go to 2)
            dfs(neighbor)

    is 2 == 2, yes
    seen = {0, 1}                       *
    loop throug vertix neighbors --> [0,2]
        if nieghbor not n sem (it is in seen, so we go to 2)
            dfs(neighbor)

*/

// Time: o(n + e)
// Graph construction: You iterate over all e edges → O(e)
// DFS traversal: In the worst case, you visit all n nodes and all e edges once → O(n + e)

// Space: O(n + e)
// Graph (grid): Stores adjacency list → O(n + e)
//      (Each edge stored twice in undirected graph)
// seen set: Up to O(n) nodes
// DFS call stack: In worst case (linear chain), depth = O(n)

/*
In an undirected graph:

Maximum number of edges = n(n−1)/2 (complete graph) where evey node is connected to all other nodes.
So e can be much larger than n (e.g., n=1000 → e up to ~500,000)
*/

func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
  guard source != destination else { return true }
  var grid = [Int: [Int]]()
  
  for edge in edges {
    grid[edge[0], default: [ ]].append(edge[1])
    grid[edge[1], default: [ ]].append(edge[0])
  }
  
  var seen = Set<Int>()
  func dfs(_ vertix: Int) -> Bool {
    if vertix == destination { return true }
    seen.insert(vertix)
    for neighbor in grid[vertix, default: [ ]] {
      if !seen.contains(neighbor) {
        if dfs(neighbor) {
          return true
        }
      }
    }
    return false
  }
  
  return dfs(source)
}

print(validPath(3, [[0,1],[1,2],[2,0]], 0, 2))
print(validPath(6, [[0,1],[0,2],[3,5],[5,4],[4,3]], 0, 5))
