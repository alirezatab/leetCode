def findMaxAverage(self, nums, k):
    sum = 0
    for i in range(k):
        sum += nums[i]

    ans = sum
    for i in range(k, len(nums)):
        sum += nums[i] - nums[i - k]
        ans = max(ans, sum)

    return ans / k

print(findMaxAverage([1,12,-5,-6,50,3], 4))
print(findMaxAverage([5], 1))