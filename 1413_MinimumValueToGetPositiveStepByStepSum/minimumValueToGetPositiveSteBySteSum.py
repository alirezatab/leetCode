def minStartValue(self, nums: List[int]) -> int:
    total = minVal = 0

    for i in range(len(nums)):
        total += nums[i]
        minVal = min(minVal, total)

    return -minVal + 1

print(minStartValue([-3,2,-3,4,2]))
print(minStartValue([1,2]))
print(minStartValue([1,-2,-3]))