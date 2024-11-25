
def getAverages(self, nums: List[int], k: int) -> List[int]:
    preSum = nums.copy()
    divisor = (k * 2) + 1
    for i in range(1, len(nums)):
        preSum[i] += preSum[i - 1]

    for i in range(len(nums)):
        if i + k >= len(nums) or i - k < 0:
            nums[i] = -1
        elif i - k == 0:
            nums[i] = preSum[i + k] // divisor
        else:
            nums[i] = (preSum[i + k] - preSum[i-k-1]) // divisor
        
    return nums

print(getAverages([7,4,3,9,1,8,5,2,6], 3))
print(getAverages([100000], 0))
print(getAverages([8], 100000))