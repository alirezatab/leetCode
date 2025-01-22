import UIKit

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
