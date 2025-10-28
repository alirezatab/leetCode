/*
sliding window and a set, if it is im a set, we take the max of the window size
curSum = 0
maxSum = 0
 s
 e
[1,2,3,2,4,3] if value @ e is in set, no, add it to the set {4}m CS = 4
 s
   e
[4,2,4,5,6] if value @ e is in set, no, add it to the set {4, 2} CS = 6
 s
     e
[4,2,4,5,6] if value @ e is in set, yes,
                    while the set contains the num at end
                        then move the window from start and subtract from sum -> CS = 2
                        and remove that value from the set {2}
                    
                    then
*/

// Time: O(n)
// Space: O(n) (since k ≤ n, and worst case k = n)
// add and remove from a set is costly... but adding and removing from an array is not, so more optimize solutoin is to use an array instead of a set

func maximumUniqueSubarraySet(_ nums: [Int]) -> Int {
  var curSum = 0
  var res = 0
  var start = 0
  var set = Set<Int>()
  
  for (end, num) in nums.enumerated() {
    while set.contains(num) {
      set.remove(nums[start])
      curSum -= nums[start]
      start += 1
    }
    
    set.insert(num)
    curSum += num
    res = max(res, curSum)
  }
  return res
}

print(maximumUniqueSubarraySet([4,2,4,5,6]))
print(maximumUniqueSubarraySet([5,2,1,2,5,2,1,2,5]))

func maximumUniqueSubarray(_ nums: [Int]) -> Int {
  var curSum = 0
  var res = 0
  var start = 0
  var isPresent = Array(repeating: false, count: 10001)
  
  for (end, num) in nums.enumerated() {
    while isPresent[num] { // while isPresent[num] == true
      isPresent[nums[start]] = false
      curSum -= nums[start]
      start += 1
    }
    
    isPresent[num] = true
    curSum += num
    res = max(res, curSum)
  }
  return res
}

print(maximumUniqueSubarray([4,2,4,5,6]))
print(maximumUniqueSubarray([5,2,1,2,5,2,1,2,5]))
