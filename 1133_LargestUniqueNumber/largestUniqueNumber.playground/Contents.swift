import UIKit

// Time: (n + k), go though nums, go through all unique Counter which is the size of max allowed 1000
// Space: o(k)
// Counting

func largestUniqueNumberCounter(_ nums: [Int]) -> Int {
  var uniqeCounter = [Int](repeating: 0, count: 1001)
  
  for num in nums {
    uniqeCounter[num] += 1
  }
  
  for numIndex in uniqeCounter.indices.reversed() { // Stride(from: , to: by: )
    if uniqeCounter[numIndex] == 1 {
      return numIndex
    }
  }
  
  return -1
}

print(largestUniqueNumberCounter([5,7,3,9,4,9,8,3,1]))
print(largestUniqueNumberCounter([9,9,8,8]))


// HasMap
// Time: (n)
// Space: o(n)
func largestUniqueNumber(_ nums: [Int]) -> Int {
  var frequencyCounter = [Int:Int]()
  
  for num in nums {
    let value = frequencyCounter[num]
    frequencyCounter[num] = value == nil ? 1 : value! + 1
    // if var counter = frequencyCounter[num] {
    //     frequencyCounter[num] += 1
    // } else {
    //     frequencyCounter[num] = 1
    // }
  }
  var largestNum = -1
  for num in frequencyCounter.keys {
    if frequencyCounter[num] == 1 && num > largestNum {
      largestNum = num
    }
  }
  
  return largestNum
}

print(largestUniqueNumber([5,7,3,9,4,9,8,3,1]))
print(largestUniqueNumber([9,9,8,8]))

// Done in a differenct way
func largestUniqueNumber(_ nums: [Int]) -> Int {
  var freqCounter = [Int: Int]()
  var maxNum = -1
  for num in nums {
    freqCounter[num, default: 0] += 1
  }
  
  for (key, value) in freqCounter {
    if value == 1 {
      maxNum = max(maxNum, key)
    }
  }
  
  return maxNum
}
