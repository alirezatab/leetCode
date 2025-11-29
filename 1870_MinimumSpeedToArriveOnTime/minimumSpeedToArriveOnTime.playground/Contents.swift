//10^7 is the max Speed
// so can go from 1 to 10^7 and check the array of distance to see which answer matches. worst time o(n^2)

// better option is to do binary search
/*
left = 1
right = 10^7

ehile left < right
    find middle is speed

    for loop of distance
        var totalTime = 0
        if last item
            totalTime += distance / middle
        else
            totalTime += ceil(distance / middle) if not last distane
    if totalTime > hour {

    }
    
*/
// Time: o(N * log k) -> n for goign through array of distances for eveyr binary search which is log of k
// Space: o(1)

import Foundation

func minSpeedOnTime(_ dist: [Int], _ hour: Double) -> Int {
  var left = 1
  var right = Int(pow(10.0, 7.0))
  var minSpeed = -1
  
  while left <= right {
    let middle = left + (right - left) / 2
    
    var totalTime = 0.0
    for (i, distance) in dist.enumerated() {
      let time = Double(distance) / Double(middle)
      if i == dist.count - 1 {
        totalTime += time
      } else {
        totalTime += ceil(time)
      }
    }
    
    if totalTime <= hour {
      minSpeed = middle
      right = middle - 1
    } else {
      left = middle + 1
    }
  }
  
  return minSpeed
}

print(minSpeedOnTime([1,3,2], 6))
print(minSpeedOnTime([1,3,2], 2.7))
print(minSpeedOnTime([1,3,2], 1.9))
