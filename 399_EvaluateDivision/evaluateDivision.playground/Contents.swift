
/*
    a/b = 2
    b/a = 1/2
    
    b/c = 3
    c/b = 1/3

             -> b =
    ["a","b"],["b","c"]
    graph {a: {b:2}, b: {c:3, a:1/2}, c: {b:1/3}}

// BFS and DFS dont matter here
    so build a graph using values

    [a,c]
    var seen = (num)
    var stack = [(num, 1)]

    then for queries,
        do a DFS for each query -> q * BFS -> doing stack cause appned and view top is faster and no shifring
        while stack not emptuy
            pop -> (num, ration) -> (a,1)

            if (num == end) { return ration}

            for (key, val) in neighbors of the graph { -> {b:2}
                if not in seen {
                    add to seen
                    add to to stacl(key, val * ration)
                }
            }

    seen == a, b
    stacl  = b, 2

    b, 2 -> c:3 and a:1/2, seen == a,b,c, stack ->(c, 2*3)
*/

// Time: o(Q (V + E))
// to build a graph -> o(e + v) to create graph of equations
//  for every query, need to do a BFS or DFS  --> o(q * (e + v)) --> or o(q * e * v)

// Space: o(V + E)
// graph will take, o(e + v)
// answer and see will also be e(e + v)

func calcEquationNotRefactored(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
  // create Graph
  var graph = [String: [String: Double]]()
  for (i, equation) in equations.enumerated() {
    let numerator = equation[0]
    let denominator = equation[1]
    let value = values[i]
    
    graph[numerator, default: [:]][denominator] = value
    graph[denominator, default: [:]][numerator] = 1 / value
  }
  
  // for loop through all queries and run DFS
  var answer = [Double]()
  outerLoop: for query in queries {
    // have a functin that returns a value
    // then append to result here --> res.append(DFS(query[0], query[1]))
    let numerator = query[0]
    let denominator = query[1]
    
    var stack = [(numerator, 1.0)]
    var seen: Set<String> = [numerator]
    
    
    guard graph[numerator] != nil, graph[denominator] != nil else {
      answer.append(-1.0)
      continue
    }
    
    while !stack.isEmpty {
      let (start, ratio) = stack.removeLast()
      if start == denominator {
        answer.append(ratio)
        continue outerLoop
      }
      
      // get key value of the neighbor map
      for (denom, num) in graph[start, default: [:]] {
        if !seen.contains(denom) {
          seen.insert(denom)
          stack.append((denom, num * ratio))
        }
      }
    }
    
    answer.append(-1)
    
  }
  
  return answer
}

print(calcEquationNotRefactored(
  [["a","b"],["b","c"]],
  [2.0,3.0],
  [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]))
print(calcEquationNotRefactored(
  [["a","b"],["b","c"],["bc","cd"]],
  [1.5,2.5,5.0],
  [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]))
print(calcEquationNotRefactored(
  [["a","b"]],
  [0.5],
  [["a","b"],["b","a"],["a","c"],["x","y"]]))
print(calcEquationNotRefactored(
  [["a","b"],["c","d"]],
  [1.0,1.0],
  [["a","c"],["b","d"],["b","a"],["d","c"]]))

func calcEquationDFSFunctionalized(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
  // create Graph
  var graph = [String: [String: Double]]()
  for (i, equation) in equations.enumerated() {
    let numerator = equation[0]
    let denominator = equation[1]
    let value = values[i]
    
    graph[numerator, default: [:]][denominator] = value
    graph[denominator, default: [:]][numerator] = 1 / value
  }
  
  var answer = [Double]()
  func answerQuery(_ start: String, _ end: String) -> Double {
    guard graph[start] != nil, graph[end] != nil else { return -1 }
    
    var stack = [(start, 1.0)]
    var seen: Set<String> = [start]
    
    while !stack.isEmpty {
      let (node, ratio) = stack.removeLast()
      if node == end {
        return ratio
      }
      
      // get key value of the neighbor map
      for (neighbor, num) in graph[node, default: [:]] {
        if !seen.contains(neighbor) {
          seen.insert(neighbor)
          stack.append((neighbor, num * ratio))
        }
      }
    }
    return -1
  }
  
  // for loop through all queries and run DFS
  for query in queries {
    answer.append(answerQuery(query[0], query[1]))
  }
  
  return answer
}

print(calcEquationDFSFunctionalized(
  [["a","b"],["b","c"]],
  [2.0,3.0],
  [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]))
print(calcEquationDFSFunctionalized(
  [["a","b"],["b","c"],["bc","cd"]],
  [1.5,2.5,5.0],
  [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]))
print(calcEquationDFSFunctionalized(
  [["a","b"]],
  [0.5],
  [["a","b"],["b","a"],["a","c"],["x","y"]]))
print(calcEquationDFSFunctionalized(
  [["a","b"],["c","d"]],
  [1.0,1.0],
  [["a","c"],["b","d"],["b","a"],["d","c"]]))

func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
  // create Graph
  var graph = [String: [String: Double]]()
  for (i, equation) in equations.enumerated() {
    let numerator = equation[0]
    let denominator = equation[1]
    let value = values[i]
    
    graph[numerator, default: [:]][denominator] = value
    graph[denominator, default: [:]][numerator] = 1 / value
  }
  
  var answer = [Double]()
  func answerQuery(_ start: String, _ end: String) -> Double {
    guard graph[start] != nil, graph[end] != nil else { return -1 }
    
    var queue = [(start, 1.0)]
    var seen: Set<String> = [start]
    var index = 0
    
    while index < queue.count {
      let (node, ratio) = queue[index]
      index += 1
      
      if node == end {
        return ratio
      }
      
      // get key value of the neighbor map
      for (neighbor, num) in graph[node, default: [:]] {
        if !seen.contains(neighbor) {
          seen.insert(neighbor)
          queue.append((neighbor, num * ratio))
        }
      }
    }
    return -1
  }
  
  // for loop through all queries and run DFS
  for query in queries {
    answer.append(answerQuery(query[0], query[1]))
  }
  
  return answer
}

print(calcEquation(
  [["a","b"],["b","c"]],
  [2.0,3.0],
  [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]))
print(calcEquation(
  [["a","b"],["b","c"],["bc","cd"]],
  [1.5,2.5,5.0],
  [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]))
print(calcEquation(
  [["a","b"]],
  [0.5],
  [["a","b"],["b","a"],["a","c"],["x","y"]]))
print(calcEquation(
  [["a","b"],["c","d"]],
  [1.0,1.0],
  [["a","c"],["b","d"],["b","a"],["d","c"]]))
