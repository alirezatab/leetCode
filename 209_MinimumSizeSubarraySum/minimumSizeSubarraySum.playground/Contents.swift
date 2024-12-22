/*
    target = 7, nums = [2,3,1,2,4,3]  min = (0, 3), sum = 8
                              i

    target = 7, nums = [2,3,1,2,4,3]  min = (0, 3), when uome >= target, move left
                        l     r

    target = 7, nums = [2,3,1,2,4,3]  min = (0, 3), when sume >= target, move left
                          l   r         sum -= v@l => 6
                                        l ++
                                        min tuple of r - l
    target = 7, nums = [2,3,1,2,4,3]  min = (0, 3), sum == 10
                            l   r         sum -= v@l => 6
                                        l ++

    var sum = 0
    var minWindowSize = infinity
    loop through that array
        get the sum
        if sum >= target
            var window = r - l + 1
            minWindowSize = min(minwindowSize, window)
            while sum >= target
                sum -= sum[l]
                l += 1
    return minWindonwSize
*/

// Time: o(n)
// Space: o(1)
func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
  var sum = 0
  var minWindow = Int.max
  var leftPtr = 0
  for (rightPtr, n) in nums.enumerated() {
    sum += n
    while sum >= target {
      var curWindow = rightPtr - leftPtr + 1
      minWindow = min(minWindow, curWindow)
      sum -= nums[leftPtr]
      leftPtr += 1
    }
  }
  return minWindow == Int.max ? 0 : minWindow
}

print(minSubArrayLen(7, [2, 3, 1, 2, 4, 3]))
print(minSubArrayLen(4, [1, 4, 4]))
print(minSubArrayLen(11, [1,1,1,1,1,1,1,1]))
