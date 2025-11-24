/*
    0 to n-1 --> 0 - 5
    connection is the edges of the city
    so this is adjanacy list.. so need to build a graph

    lets build a unidirectional grap
    save the routes in a set ==> {(0,1), (1,3), (2,3), (4,0), (4,5)}

    graph = {0: [1,4], 1:[0,3], 3:[1,2], 2:[3], 4:[0,5], 5: [4]}

    ans = 0

    dfs(0)                       *
        seen = {0}, neighbors = [1,4]
        ans = 1 since (0,1) in routes
        if 1 != in seen
            dfs(neighbor)
    dfs(1)                          *
        seen = {0, 1}, neighbors = [0,3]
        if 0 != in seen --> but it is in seen
            dfs(neighbor)             *
        seen = {0, 1}, neighbors = [0,3]
        ans = 2 since 1,3 is in routed
        if 3 != in seen
            dfs(neighbor)
    dfs(3)                               *
        seen = {0, 1, 3}, neighbors = [1,2], so one is in seen we go to 2
        if 2 != in seen
            dfs(neighbor)

    dfs(2)
        seen = {0, 1, 3, 2}, neighbors = [3], so 3 is in seen so dfs ends
        if 2 != in seen
            anser = 3 since 2 and 3 is in it
            return dfs(neighbor)
    dfs(0)                                  *
        seen = {0, 1, 3, 2}, neighbors = [1,4]
        if 4 != in seen
            dfs(neighbor)
    dfs(4)
        seen = {0, 1, 3, 2, 4}, neighbors = [5]
        if 5 != in seen
            4,5 is in so inc ans
            dfs(neighbor)

    seen = Set<Int>()
    ans += 1
    func dfs(vertix)
        add vertix to seen

        for loop through 0 to n -1 in grid --> at 0, [1,4]
            if neighbor not in seen
                if routes.contains(vertix, neighbor)
                    ans +=1
                dfs(neighbor)

    dfs(0)
*/

// Time: o(n) --> n is the numbder of vertices
// 💡 Note: Strictly speaking, it's O(V + E), but since E = V − 1 in a tree, O(V + E) = O(n). So your simplification is valid for this problem.
// to build graph, "The graph has n nodes and n−1 edges, so both time and space are linear in n."
// dfs goes from 0 and visits all the nodes ... so 0(n + e) and since e is at max n, we can say o(n))

// Space: o(n)
// for graph, stores 2 × (n − 1) integers → O(n)
// raods is o(n)
// seen: up to n integers → O(n)
// dfs, DFS recursion stack: depth up to n (in a skewed tree) → O(n)

func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
  var roads = Set<String>()
  var graph = [Int: [Int]]()
  for connection in connections {
    graph[connection[0], default: [ ]].append(connection[1])
    graph[connection[1], default: [ ]].append(connection[0])
    roads.insert("\(connection[0]),\(connection[1])")
  }
  
  var seen = Set<Int>()
  func dfs(_ vertix: Int) -> Int {
    var count = 0
    seen.insert(vertix)
    for neighbor in graph[vertix, default: [ ]] {
      if !seen.contains(neighbor) {
        if roads.contains("\(vertix),\(neighbor)") {
          count += 1
        }
        count += dfs(neighbor)
      }
    }
    return count
  }
  
  return dfs(0)
}

print(minReorder(6, [[0,1],[1,3],[2,3],[4,0],[4,5]]))
print(minReorder(5, [[1,0],[1,2],[3,2],[3,4]]))
print(minReorder(3, [[1,0],[2,0]]))

func minReorderMyWay(_ n: Int, _ connections: [[Int]]) -> Int {
  var roads = Set<String>()
  var graph = [Int: [Int]]()
  for connection in connections {
    graph[connection[0], default: [ ]].append(connection[1])
    graph[connection[1], default: [ ]].append(connection[0])
    roads.insert("\(connection[0]),\(connection[1])")
  }
  
  var seen = Set<Int>()
  var ans = 0
  func dfs(_ vertix: Int) {
    seen.insert(vertix)
    for neighbor in graph[vertix, default: [ ]] {
      if !seen.contains(neighbor) {
        if roads.contains("\(vertix),\(neighbor)") {
          ans += 1
        }
        dfs(neighbor)
      }
    }
  }
  
  dfs(0)
  return ans
}

func minReorderTutorialWay(_ n: Int, _ connections: [[Int]]) -> Int {
  var roads = Set<String>()
  var graph = [Int: [Int]]()
  for connection in connections {
    graph[connection[0], default: [ ]].append(connection[1])
    graph[connection[1], default: [ ]].append(connection[0])
    roads.insert("\(connection[0]),\(connection[1])")
  }
  
  var seen = Set<Int>()
  func dfs(_ node: Int) -> Int {
    var ans = 0
    for neighbor in graph[node, default: [ ]] {
      if !seen.contains(neighbor) {
        if roads.contains(("\(node),\(neighbor)")) {
          ans += 1
        }
        seen.insert(neighbor)
        ans += dfs(neighbor)
      }
    }
    return ans
  }
  
  seen.insert(0)
  return dfs(0)
}
