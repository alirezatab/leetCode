def longestOnes(self, nums: List[int], k: int) -> int:  
    left = ans = 0

    for right in range(len(nums)):
        if nums[right] == 0:
            k -= 1
            while k < 0:
                if nums[left] == 0:
                    k += 1
                left += 1
        ans = max(ans, right - left + 1)

    return ans

print(longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2))
print(longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3))