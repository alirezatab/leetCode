import UIKit

// you can also use a set in here. try that next time instead of dictionary
// Time: o(n)
// Space: o(n)
func destCity(_ paths: [[String]]) -> String {
  var map = [String: String]()
  for path in paths {
    let source = path[0]
    let destination = path[1]
    
    map[source] = destination
  }
  
  for destination in map.values {
    guard map[destination] != nil else { return destination }
  }
  return ""
}

print(destCity([["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]))
print(destCity([["B","C"],["D","B"],["C","A"]]))
print(destCity([["A","Z"]]))

// 2 Sets
// Time: o(n)
// Space: o(n)
func destCityTwoSet(_ paths: [[String]]) -> String {
    var setSource = Set<String>()
    var setDes = Set<String>()
    for path in paths {
        let source = path[0]
        let destination = path[1]

        setSource.insert(source)
        setDes.insert(destination)
    }

    for destination in setDes {
        guard setSource.contains(destination) else { return destination }
    }
    return ""
}

print(destCityTwoSet([["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]))
print(destCityTwoSet([["B","C"],["D","B"],["C","A"]]))
print(destCityTwoSet([["A","Z"]]))

// 1 set
// Time: o(n)
// Space: o(n)
// best solution cause a bit faster eventhough time and space are the same
func destCityOneSet(_ paths: [[String]]) -> String {
    var setSource = Set<String>()
    for path in paths {
        let source = path[0]
        setSource.insert(source)
    }

    for path in paths {
        let destination = path[1]
        guard setSource.contains(destination) else { return destination }
    }
    return ""
}

print(destCityOneSet([["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]))
print(destCityOneSet([["B","C"],["D","B"],["C","A"]]))
print(destCityOneSet([["A","Z"]]))
