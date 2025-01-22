import UIKit

// Time: o(n)
// Space: o(n)
func sumOfUnique(_ nums: [Int]) -> Int {
  let frequencies = nums.reduce(into: [Int: Int]()) { counts, num in
    counts[num, default: 0] += 1
  }
  
  return frequencies.filter { $0.value == 1 }.map { $0.key }.reduce(0, +)
}

print(sumOfUnique([1,2,3,2]))
print(sumOfUnique([1,1,1,1,1]))
print(sumOfUnique([1,2,3,4,5]))
