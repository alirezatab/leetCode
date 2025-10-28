import UIKit

/*
     x, y
N = (0, 1)
E = (1, 0)
S = (0, -1)
W = (-1, 0)

 *  (0,1), 1,1 1,0 --. Add the ponts to visisted
"NES"

if already in visited, then return tru


at the end, return false
var visisted = { (0,0) } --> tuple
var x = 0
var y = 0

for loop through point in paths
    switch point:
        case N
            y += 1
        case E
           x += 1
        case W
            x -= 1
        case S
            y -= 1
        default break

    point = (x, y)

    if set.contains(point)
        return trun
    else
        set.insert(point)

return false
*/

struct Point: Hashable {
  let x: Int
  let y: Int
}

func isPathCrossing(_ path: String) -> Bool {
  var currentPoint = Point(x: 0, y: 0)
  var set = Set<Point>()
  set.insert(currentPoint)
  
  for char in path {
    switch char {
    case "N":
      currentPoint = Point(x: currentPoint.x, y:  currentPoint.y + 1)
    case "E":
      currentPoint = Point(x: currentPoint.x + 1, y: currentPoint.y)
    case "S":
      currentPoint = Point(x: currentPoint.x, y: currentPoint.y - 1)
    case "W":
      currentPoint = Point(x: currentPoint.x - 1, y: currentPoint.y)
    default:
      continue
    }
    
    if set.contains(currentPoint) {
      return true
    } else {
      set.insert(currentPoint)
    }
  }
  return false
}

print(isPathCrossing("NES"))
print(isPathCrossing("NESWW"))


func isPathCrossing2(_ path: String) -> Bool {
  var x = 0
  var y = 0
  // this is correct but since leetcode and playground have bugs, need to change it to
  // a Set<string>
  // Tuples automatically conform to Equatable, Comparable, and Hashable when all their element types conform to those protocols.
  // var visited: Set<(Int, Int)> = Set([(0, 0)])
  var visited: Set<String> = ["0, 0"]
  
  for char in path {
    switch char {
    case "N": y += 1
    case "S": y -= 1
    case "E": x += 1
    case "W": x -= 1
    default: break
    }
    
    let point = "\(x), \(y)"
    if visited.contains(point) {
      return true
    }
    visited.insert(point)
  }
  
  return false
}

print(isPathCrossing2("NES"))
print(isPathCrossing2("NESWW"))


func isPathCrossing3(_ path: String) -> Bool {
  var currentPoint = CGPoint(x: 0, y: 0)
  var set = Set<CGPoint>()
  set.insert(currentPoint)
  
  for char in path {
    switch char {
    case "N":
      currentPoint = CGPoint(x: currentPoint.x, y:  currentPoint.y + 1)
    case "E":
      currentPoint = CGPoint(x: currentPoint.x + 1, y: currentPoint.y)
    case "S":
      currentPoint = CGPoint(x: currentPoint.x, y: currentPoint.y - 1)
    case "W":
      currentPoint = CGPoint(x: currentPoint.x - 1, y: currentPoint.y)
    default:
      continue
    }
    
    if set.contains(currentPoint) {
      return true
    } else {
      set.insert(currentPoint)
    }
  }
  return false
}

print(isPathCrossing3("NES"))
print(isPathCrossing3("NESWW"))
