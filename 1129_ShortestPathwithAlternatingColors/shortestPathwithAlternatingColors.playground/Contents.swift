/*
[R||B: vetix: [neighbors]]
[String: [ Int: [ ]]]

return an array of lenght n... so create an array with -1s with length n
{
    red: {
        0: [1],
        1: [2]
    },
    blue:{

    }
}

queue = [(0, red, 0), (0, blue, 0))]
seen = [(0, red), (0, blue))]

queue = [(0, red, 0), (0, blue, 0))] -> deue == (0, red, 0) --> asw=[0,-1,-1]
queue = [(0, blue, 0))] -> neighbor == [1], if (1, blue) mot in seen... it is not --> queue = [(0, blue, 0), (1, blue, 1)]
seen = [(0, red), (0, blue), (1, blue)]

queue = [(0, blue, 0), (1, blue, 1)] -> deue == (0, blue, 0)  --> asw=[0,-1,-1]
queue = [(1, blue, 1)] -> neighbor == []
seen = [(0, red), (0, blue), (1, blue)]

queue = [(1, blue, 1)] -> deue == (1, blue, 1) -->   asw=[0,1,-1]
queue = [] -> neighbor == []
seen = [(0, red), (0, blue), (1, blue)]

then do BFS

ans = Array(repeting: Int.max, count: n)
queue = [(0, red, 0), (0, blue, 0))]
seen = [(0, red), (0, blue))]

while !queue.isEmpty
    let (node, color, steps) = deque

    ans[node] = steps
    for neighbor in neighbors[color][node]
        if (neigbor, toggle color) not in seen
            seen.insert(neighbor, toggle of coloe)
            queue.appen(neighbor, toggle of color, steps + 1)


{
    red: {
        0: [1]
    },
    blue:{
        2: [1]
    }
}

RED: [[0,1],[1,2],[2,3],[3,4]]
BLUE: [[1,2],[2,3],[3,1]]

// when you have the same nodes and edges for both red and blue, then have to take the min steps
{
    red: {
        0: [1],
        1: [2],
        2: [3],
        3: [4]
    },
    BLUE: {
        1: [2],
        2: [3],
        3: [1]
    }
}
*/

// Time: O(n + R + B)
/*
You build the graph by iterating over:
    - redEdges → R edges
    - blueEdges → B edges
        → O(R + B)
✅ So total time = O(R + B) for graph building + O(R + B) for BFS edge traversal + O(n) for initializing ans
    → O(n + R + B)
*/

// Space: o(n + R + B)
/*
Graph storage:
    - Red adjacency list: stores R entries
    - Blue adjacency list: stores B entries
        → O(R + B)
    - ans array: O(n)
    - seen set: stores at most 2n states → O(n)
    - Queue: holds at most 2n elements → O(n)
✅ Total space = O(n + R + B)
*/

func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
  var ans = Array(repeating: Int.max, count: n)
  var graph = [String: [Int: [Int]]]()
  
  for edge in redEdges {
    let u = edge[0]
    let v = edge[1]
    graph["RED", default: [:]][u, default: []].append(v)
  }
  for edge in blueEdges {
    let u = edge[0]
    let v = edge[1]
    graph["BLUE", default: [:]][u, default: []].append(v)
  }
  
  var queue = [("RED", 0, 0), ("BLUE", 0, 0)]
  var seen: Set<[String]> = [["RED", "0"], ["BLUE", "0"]]
  
  while !queue.isEmpty {
    let (color, node, steps) = queue.removeFirst()
    
    ans[node] = min(ans[node], steps)
    for neighbor in graph[color, default: [:]][node, default: []] {
      let toggleColor = color == "RED" ? "BLUE" : "RED"
      if !seen.contains([toggleColor, "\(neighbor)"]) {
        seen.insert([toggleColor, "\(neighbor)"])
        queue.append((toggleColor, neighbor, steps + 1))
      }
    }
  }
  
  return ans.map { $0 == Int.max ? -1 : $0}
}

print(shortestAlternatingPaths(3, [[0,1],[1,2]], []))
print(shortestAlternatingPaths(3, [[0,1]], [[2,1]]))
print(shortestAlternatingPaths(5, [[0,1],[1,2],[2,3],[3,4]], [[1,2],[2,3],[3,1]]))
