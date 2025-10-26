
func pivotIndex(_ nums: [Int]) -> Int {
  var sum = 0
  var leftSum = 0
  for num in nums {
    sum += num
  }
  
  for i in 0..<nums.count {
    if leftSum == sum - leftSum - nums[i] {
      return i
    }
    leftSum += nums[i]
  }
  
  return -1
}

print(pivotIndex([1,7,3,6,5,6]))
print(pivotIndex([1,2,3]))
print(pivotIndex([2,1,-1]))
