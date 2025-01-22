import UIKit

// you can also use a set in here. try that next time instead of dictionary
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
