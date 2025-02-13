import UIKit

// Time: o(n^2)
// Space: o(1)
func numIdenticalPairsBruteForce(_ nums: [Int]) -> Int {
  var numGoodPairs = 0
  var start = 0
  while start < nums.count {
    for end in start+1..<nums.count {
      if nums[start] == nums[end] {
        numGoodPairs += 1
      }
    }
    start += 1
  }
  return numGoodPairs
}

print(numIdenticalPairsBruteForce([1,2,3,1,1,3]))
print(numIdenticalPairsBruteForce([1,1,1,1]))
print(numIdenticalPairsBruteForce([1,2,3]))

// do it using dictionary
// Time: o(n)
// Space: o(n)
func numIdenticalPairs(_ nums: [Int]) -> Int {
  var numGoodPairs = 0
  var freqCounter = [Int: Int]()
  
  for num in nums {
    if let freq =  freqCounter[num] {
      numGoodPairs += freq
      freqCounter[num] = freq + 1
    } else {
      freqCounter[num] = 1
    }
  }
  return numGoodPairs
}

print(numIdenticalPairs([1,2,3,1,1,3]))
print(numIdenticalPairs([1,1,1,1]))
print(numIdenticalPairs([1,2,3]))
