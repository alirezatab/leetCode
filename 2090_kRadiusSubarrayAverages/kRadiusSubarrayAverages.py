
def getAverages(nums: List[int], k: int) -> List[int]:
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

def getAverages2(nums: List[int], k: int) -> List[int]:
    if k == 0:
        return nums
    windowSize = (k * 2) + 1
    averages = [-1] * len(nums)
    
    if windowSize > len(nums):
        return averages

# First get the sum of first window of the 'nums' arrray.
    # windowSum = 0
    # for i in range(windowSize):
    #     windowSum += nums[i]
    windowSum = sum(nums[:windowSize]) #shorthand version, forgtot he official name
    averages[k] = windowSum // windowSize

    for i in range(windowSize, len(nums)):
        windowSum += nums[i] - nums[i - windowSize]
        averages[i - k] = windowSum // windowSize

    return averages

print(getAverages2([7,4,3,9,1,8,5,2,6], 3))
print(getAverages2([100000], 0))
print(getAverages2([8], 100000))



































