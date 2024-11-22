def runningSum(nums: List[int]) -> List[int]:
    for i in range(1, len(nums)):
        nums[i] += nums[i - 1]
    return nums

print(runningSum([1,2,3,4])) # [1,3,6,10]
print(runningSum([1,1,1,1,1])) # [1,2,3,4,5]
print(runningSum([3,1,2,10,1])) # [3,4,6,16,17]