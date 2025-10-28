// Time: o(n)
// Space: o(k)
// this is more conventional
func numSubarraysWithSumPrefixSum(_ nums: [Int], _ goal: Int) -> Int {
  var prefixSumToCount = [0: 1] // Initialize with prefix sum 0 occurring once
  var totalCount = 0
  var curSum = 0
  
  for num in nums {
    curSum += num
    // We always look for (curSum - goal)
    totalCount += prefixSumToCount[curSum - goal, default: 0]
    // Record current prefix sum
    prefixSumToCount[curSum, default: 0] += 1
  }
  
  return totalCount
}

func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
  var prefixSumToCount = [Int: Int]()
  var totalCount = 0
  var curSum = 0
  
  for (end, num) in nums.enumerated() {
    curSum += num
    
    if curSum == goal {
      totalCount += 1
    }
    
    if let val = prefixSumToCount[curSum - goal] {
      totalCount += val
    }
    
    prefixSumToCount[curSum, default: 0] += 1
  }
  
  return totalCount
}

// Time: o(n)
// Space: o(1)
func numSubarraysWithSumSlidingWindow(_ nums: [Int], _ goal: Int) -> Int {
  slidingWindowAtMost(nums, goal) - slidingWindowAtMost(nums, goal - 1)
}

func slidingWindowAtMost(_ nums: [Int], _ goal: Int) -> Int {
  var start = 0
  var curSum = 0
  var totalCount = 0
  
  for (end, num) in nums.enumerated() {
    curSum += num
    
    while start <= end && curSum > goal {
      curSum -= nums[start]
      start += 1
    }
    
    totalCount += end - start + 1
  }
  
  return totalCount
}
