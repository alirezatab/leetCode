// one is using a set
// set is on(n) time and space cuase we need to ad the outbound node at each edge
// then loop thorugh 0 < n and any value missing will be appended to result

/*
// create an array of size n, initilize to 0s
// counter -->  [0, 0, 0, 0, 0]
    *
[[0,1],[0,2],[2,5],[3,4],[4,2]] -> [0, 1, 0, 0, 0, 0]

          *
[[0,1],[0,2],[2,5],[3,4],[4,2]] -> [0, 1, 1, 0, 0, 0]

                *
[[0,1],[0,2],[2,5],[3,4],[4,2]] -> [0, 1, 1, 0, 0, 1]

                      *
[[0,1],[0,2],[2,5],[3,4],[4,2]] -> [0, 1, 1, 0, 1, 1]

                            *
[[0,1],[0,2],[2,5],[3,4],[4,2]] -> [0, 1, 2, 0, 1, 1]

then loop the counter and any val @ index == 0, add to index answer

[0,3]

go from edges and count the indegrees using for loop
    for edge in edges {
        let inDegreeNode = edge[1]
        count[inDegreeNode] += 1
    }
*/
// Time: o(V + E)
// Time: o(n) == o(V)
func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
  var indegreeCounter = Array(repeating: 0, count: n)
  var result = [Int]()
  
  for edge in edges {
    let inDegreeNode = edge[1]
    indegreeCounter[inDegreeNode] += 1
  }
  
  for (i, val) in indegreeCounter.enumerated() {
    if val == 0 {
      result.append(i)
    }
  }
  
  return result
}

print(findSmallestSetOfVertices(6, [[0,1],[0,2],[2,5],[3,4],[4,2]]))
print(findSmallestSetOfVertices(5, [[0,1],[2,1],[3,1],[1,4],[2,4]]))

func findSmallestSetOfVerticesUsingSet(_ n: Int, _ edges: [[Int]]) -> [Int] {
  var seen = Set<Int>()
  var res = [Int]()
  for edge in edges {
    seen.insert(edge[1])
  }
  
  for node in 0..<n {
    if !seen.contains(node) {
      res.append(node)
    }
  }
  
  return res
}

print(findSmallestSetOfVerticesUsingSet(6, [[0,1],[0,2],[2,5],[3,4],[4,2]]))
print(findSmallestSetOfVerticesUsingSet(5, [[0,1],[2,1],[3,1],[1,4],[2,4]]))
