import UIKit

// There is a way to do it in one go.
    /*
    Time: o(n)
        Calculating the frequency of each element in nums takes O(n).
        Finding the maximum frequency takes O(e) where e is the number of distinct elements in nums. At worst, there can be n distinct elements, so this step takes O(n).
        Calculating total frequencies takes O(e) where e is the number of distinct elements in nums. At worst, there can be n distinct elements, so this step takes O(n).
        The total time complexity will be O(3n), which we can simplify to O(n).
    
    space: 0 (n)
        We use a few variables and the map frequencies, which is size O(e) where e is the number of distinct elements in nums. At worst, there can be n distinct elements, so the space complexity is O(n).
    */

func maxFrequencyElements(_ nums: [Int]) -> Int {
  var frequencies = [Int: Int]()
  var maxFreq = 0
  var result = 0
  for num in nums {
    if let frequency = frequencies[num] {
      frequencies[num] = frequency + 1
    } else {
      frequencies[num] = 1
    }
  }
  
  for freq in frequencies.values {
    maxFreq = max(maxFreq, freq)
  }
  
  for freq in frequencies.values {
    if freq == maxFreq {
      result += freq
    }
  }
  return result
}

print(maxFrequencyElements([1,2,2,3,1,4]))
print(maxFrequencyElements([1,2,3,4,5]))


func maxFrequencyElementsFunctional(_ nums: [Int]) -> Int {
  // Calculate frequencies using reduce
  let frequencies = nums.reduce(into: [Int: Int]()) { counts, num in
    counts[num, default: 0] += 1
  }
  
  // Find the maximum frequency
  guard let maxFreq = frequencies.values.max() else { return 0 }
  
  return frequencies.values.filter { $0 == maxFreq }.reduce(0, +)
}

print(maxFrequencyElementsFunctional([1,2,2,3,1,4]))
print(maxFrequencyElementsFunctional([1,2,3,4,5]))

func maxFrequencyElementsFunctiona2(_ nums: [Int]) -> Int {
  var maxFreq = 0
  var result = 0
  let freq = nums.reduce([Int: Int]()) { counterDic, num in
    var tempCounterDic = counterDic
    tempCounterDic[num, default: 0] += 1
    maxFreq = max(maxFreq, tempCounterDic[num]!)
    return tempCounterDic
  }
  
  // for (num, count) in freq where count == maxFreq {
  //     result += count
  // }
  
  // return result
  return freq.values.filter { $0 == maxFreq }.reduce(0, +)
}

print(maxFrequencyElementsFunctiona2([1,2,2,3,1,4]))
print(maxFrequencyElementsFunctiona2([1,2,3,4,5]))
