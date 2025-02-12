import UIKit

func findMaxLength(_ nums: [Int]) -> Int {
  var count = 0
  var maxLength = 0
  var countMap: [Int : Int] = [0: -1]
  for (curIndex, num) in nums.enumerated() {
    count += num == 1 ? 1 : -1
    if let savedIndex = countMap[count] {
      let length = curIndex - savedIndex
      maxLength = max(maxLength, length)
    } else {
      countMap[count] = curIndex
    }
  }
  return maxLength
}

print(findMaxLength([0,1]))
print(findMaxLength([0,1,0]))
print(findMaxLength([0,1,0,1,1,1,0,1,0]))
