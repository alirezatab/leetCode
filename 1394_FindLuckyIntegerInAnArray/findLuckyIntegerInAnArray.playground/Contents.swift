import UIKit

// Time: o(n)
// Space: o(n39)
func findLucky(_ arr: [Int]) -> Int {
  let frequencies = arr.reduce(into: [Int: Int]()) { counts, num in
    counts[num, default: 0] += 1
  }
  
  let luckyNumbers = frequencies.filter { $0.key == $0.value }.map { $0.key }
  
  return luckyNumbers.count == 0 ? -1 : luckyNumbers.max()!
}

print(findLucky([2,2,3,4]))
print(findLucky([1,2,2,3,3,3]))
print(findLucky([2,2,2,3,3]))
