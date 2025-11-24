/*
    first add restricted to a set so we can do a o(1) loop up
    go through the edges and make a bi-directional graph

    visited = set(ristricted)
    vertix as key an value
    var maxNodes = 0
    /// so to create the graph, we dont need to create it when restricted nodes are in it
    graph {
        0 : [1],
        1: [0, 2, 3],
        2: [1],
        3: [1]
    }
    [0: [1], 1: [0, 2, 3], 3: [1], 2: [1]]
    graph if adjacency list == [[1], [0, 2, 3], [1], [1], [], [], []]

    dfs(vertix)
        validPathCount = 0

        for neighbor from gid[vertix] where nieghber is not in restricted Set
            validPathCount += 1
            validPathCount += dfs(neighbor)

        return validpath

    max(maxNodes, dfs(0))
*/

// Time: o(V + E)
// You iterate over all E edges → O(E)
//  - You visit each reachable, non-restricted node exactly once.
//  - For each such node, you iterate through its neighbors in the filtered graph.
//Let:
//      * V' = number of non-restricted nodes reachable from 0
//      * E' = number of edges between non-restricted nodes
//Then DFS takes O(V' + E')

// But in worst case:
// No nodes are restricted → V' = n = V, E' = E
// So worst-case time = O(E) [build] + O(V + E) [DFS] = O(V + E)

// Time: o(V + E)
// restrictedSet: stores up to R restricted nodes → O(R) ≤ O(V)
// graph stores o(V + E)
// visited set: up to V' ≤ V → O(V)
// DFS recursion stack: depth up to V' → O(V)
func reachableNodesAdjacencyList(_ n: Int, _ edges: [[Int]], _ restricted: [Int]) -> Int {
  // build adjacency graph
  // better to use adjacency list [[]] to build the graph instead of Dict
  let restrictedSet = Set(restricted)
  
  var graph = Array(repeating: [Int](), count: n)
  for edge in edges {
    let nodeA = edge[0]
    let nodeB = edge[1]
    if !restrictedSet.contains(nodeA) && !restrictedSet.contains(nodeB) {
      graph[nodeA].append(nodeB)
      graph[nodeB].append(nodeA)
    }
  }
  
  var visited = Set<Int>()
  func dfs(_ vertix: Int) -> Int {
    var count = 1
    visited.insert(vertix)
    for neighbor in graph[vertix]
    where !restrictedSet.contains(neighbor) && !visited.contains(neighbor) {
      count += dfs(neighbor)
    }
    return count
  }
  
  return dfs(0)
}

print(reachableNodesAdjacencyList(7, [[0,1],[1,2],[3,1],[4,0],[0,5],[5,6]], [4,5]))
print(reachableNodesAdjacencyList(7, [[0,1],[0,2],[0,5],[0,4],[3,2],[6,5]], [4,2,1]))

func reachableNodes(_ n: Int, _ edges: [[Int]], _ restricted: [Int]) -> Int {
  // build adjacency graph
  // better to use [[]] to build the graph instead of Dict
  let restrictedSet = Set(restricted)
  
  var graph = [Int: [Int]]()
  for edge in edges {
    let nodeA = edge[0]
    let nodeB = edge[1]
    if !restrictedSet.contains(nodeA) && !restrictedSet.contains(nodeB) {
      graph[nodeA, default: [ ]].append(nodeB)
      graph[nodeB, default: [ ]].append(nodeA)
    }
  }
  
  var visited = Set<Int>()
  func dfs(_ vertix: Int) -> Int {
    var count = 1
    visited.insert(vertix)
    for neighbor in graph[vertix, default: [ ]]
    where !restrictedSet.contains(neighbor) && !visited.contains(neighbor) {
      count += dfs(neighbor)
    }
    return count
  }
  
  return dfs(0)
}

print(reachableNodes(7, [[0,1],[1,2],[3,1],[4,0],[0,5],[5,6]], [4,5]))
print(reachableNodes(7, [[0,1],[0,2],[0,5],[0,4],[3,2],[6,5]], [4,2,1]))
