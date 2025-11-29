/*

    preReq is empty... then you can technically take all the courses. so valid is an arr from 0..<n
    //  Kahn's algorithm with BFS... or you can use DFS but need to keep track of  if the node has been visited before or not
    ... first ill do BFS
    I need to know which node to start my BFS... so while creating graphs, I count the number of indegress. the ones with zero are the starting points

    BFS
    // create the graph
    { pre: [course]
        0:[1,2],
        1:[3],
        2:[3]
    }
    indegree = [0,0,0,0]
      *
    [[1,0],[2,0],[3,1],[3,2]]
    inc index 1, indegree = [0,1,0,0]
            *
    [[1,0],[2,0],[3,1],[3,2]]
    inc index 2, indegree = [0,1,1,0]
                  *
    [[1,0],[2,0],[3,1],[3,2]]
    inc index 2, indegree = [0,1,1,1]
                        *
    [[1,0],[2,0],[3,1],[3,2]]
    inc index 2, indegree = [0,1,1,2]

    queue = [0] -> dequeue 0 -> add to result, res = [0] -> neighbors [1,2]
    loop through 1,2
        indegree[neighbor] -= 1 -->  -> [0,0,1,2]
        at 1...
            add to queue
            subtract 1 from indegree at 1 -> [0,0,1,2]
        
        indegree[neighbor] -= 1 -->  -> [0,0,0,2]
        at 2...
            add to queue


    queue = [1,2] -> dequeue 1 -> add to result, res = [0,1] -> neighbors [3]
    loop through 3
        indegree[neighbor] -= 1 --> [0,0,0,1]
        at 3...
            if indegree == 0
                add to queue

    queue = [2] -> dequeue 2 -> add to result, res = [0,1,2] -> neighbors [3]
    loop through 3
        indegree[neighbor] -= 1 --> [0,0,0,0]
        at 3...
            if indegree == 0
                add to queue
    
        queue = [3] -> dequeue 3 -> add to result, res = [0,1,2,3] -> neighbors []


    { pre: [course]
        0:[1],
        1:[0]
    } // you have a cycle

    indegree = [0,0]
      *
    [[1,0],[0,1]]
    inc index 1, indegree = [0,1]
            *
    [[1,0],[0,1]]
    inc index 1, indegree = [1,1]

    queue is empty so BFS is skipped and we return []

for loop though indegree and add 0 values to queue for starting point

    // create the graph
    // calcualte indegree array
    // queue = [indegree == 0's]

    
*/

// Time: O(V + E)
// Space: O(V + E)

func findOrderBFS(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
  guard !prerequisites.isEmpty else { return Array(0..<numCourses) }
  var graph = [Int: [Int]]()
  var indegree = Array(repeating: 0, count: numCourses)
  
  // create graph and add indegrees
  for prereq in prerequisites {
    let nextCourse = prereq[0]
    let prereqCourse = prereq[1]
    graph[prereqCourse, default: []].append(nextCourse)
    indegree[nextCourse] += 1
  }
  
  // BFS
  var queue = [Int]()
  for (i, start) in indegree.enumerated() {
    if start == 0 {
      queue.append(i)
    }
  }
  
  var res = [Int]()
  while !queue.isEmpty {
    let course = queue.removeFirst()
    res.append(course)
    
    for nextCourse in graph[course, default: [ ]] {
      indegree[nextCourse] -= 1
      // means all preReq has been taken and this is the begining course of the new graph
      if indegree[nextCourse] == 0 {
        queue.append(nextCourse)
      }
    }
  }
  
  return res.count == numCourses ? res : [ ]
}

print(findOrderBFS(2, [[1,0]]))
print(findOrderBFS(4, [[1,0],[2,0],[3,1],[3,2]]))
print(findOrderBFS(1, []))
print(findOrderBFS(2, [[0,1],[1,0]]))

/*
 for DFS, you do the same thing to create the graph
 use enum for the 3 state, not visited, visiting and visited
 keep an array of visited that has the same number of course but uses these 3 state
 flag for when cycle has been found to return
 
 do DFS(course)
 if cycleFlag == true. retrurn
 visited[course] == .visiting
 
 get nrighbors and for loop
 if visited[nrighbors] == .notVisited
 dfs(neighbor)
 else if visited[nrighbors] == .visiting {
 cycleFlag is turned to true
 reruen
 }
 visited[course] = .visited
 res.append(coutse)
 
 for all courses from zero to numCourses.count -1
 if not visited
 dfs(course)
 if hasCycle { return [ ]}
 
 return res.reversed() cause dfs, is adding result in a stack so it will be a reverse order
 */
// TRim: o(V + E)
// Space: o(V + E)
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
  guard !prerequisites.isEmpty else { return Array(0..<numCourses) }
  var graph = [Int: [Int]]()
  
  enum nodeState {
    case notVisited
    case visiting
    case visited
  }
  
  // create graph and add indegrees
  for prereq in prerequisites {
    let nextCourse = prereq[0]
    let prereqCourse = prereq[1]
    graph[prereqCourse, default: []].append(nextCourse)
  }
  
  var visited = Array(repeating: nodeState.notVisited, count: numCourses)
  var hasCycle = false
  var result = [Int]()
  func dfs(_ course: Int) {
    if hasCycle { return }
    visited[course] = .visiting
    
    for nextCourse in graph[course, default: []] {
      if visited[nextCourse] == .notVisited {
        dfs(nextCourse)
      } else if visited[nextCourse] == .visiting {
        hasCycle = true
        return
      }
    }
    visited[course] = .visited
    result.append(course)
  }
  
  for course in 0..<numCourses {
    if visited[course] == .notVisited {
      dfs(course)
    }
    if hasCycle { return [ ] }
  }
  
  
  return result.reversed()
}

print(findOrder(2, [[1,0]]))
print(findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))
print(findOrder(1, []))
print(findOrder(2, [[0,1],[1,0]]))
