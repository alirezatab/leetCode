import Foundation

func largestAltitude(_ gain: [Int]) -> Int {
    var highestAlt = 0
    var curAlt = 0
    for g in gain {
      curAlt += g
      highestAlt = max(highestAlt, curAlt)
    }
    return highestAlt
}

print(largestAltitude([-5,1,5,0,-7]))
print(largestAltitude([-4,-3,-2,-1,4,3,2]))
