import Foundation

// My solution
func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
  var res = nums
  var preSumArr = nums
  let divisor = (k*2)+1
  
  for i in 1..<nums.count {
      preSumArr[i] += preSumArr[i - 1]
  }
  
  for i in 0..<nums.count {
      if i + k >= nums.count || i - k < 0 {
          res[i] = -1
      } else if i - k == 0 {
          res[i] = preSumArr[i+k] / divisor
      } else {
          res[i] = (preSumArr[i+k] - preSumArr[i-k-1]) / divisor
      }
  }
  return res
}

print(getAverages([7,4,3,9,1,8,5,2,6], 3))
print(getAverages([100000], 0))
print(getAverages([8], 100000))

// leetcode solution
func getAverages2(_ nums: [Int], _ k: Int) -> [Int] {
  guard k != 0 else { return nums }
  
  let windowSize = (k * 2)+1
  let n = nums.count
  var averages = Array(repeating: -1, count: n)
  
  guard windowSize <= n else { return averages }

  var prefix = Array(repeating: 0, count: n + 1)
  for i in 0..<n {
      prefix[i + 1] = prefix[i] + nums[i]
  }

  print(prefix)
  
  for i in k..<(n-k) {
      let leftBound = i - k, rightBound = i + k
      let subArraySum = prefix[rightBound + 1] - prefix[leftBound]
      let average = subArraySum / windowSize
      averages[i] = average
  }

  return averages
}

print(getAverages2([7,4,3,9,1,8,5,2,6], 3))
print(getAverages2([100000], 0))
print(getAverages2([8], 100000))
