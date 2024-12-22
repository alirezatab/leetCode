def minSubArrayLen(self, target: int, nums: List[int]) -> int:
    sum = 0
    min_window = float('inf')
    left_ptr = 0

    for right_ptr in range(len(nums)):
        sum += nums[right_ptr]
        while sum >= target:
            cur_window = right_ptr - left_ptr + 1
            min_window = min(min_window, cur_window)
            sum -= nums[left_ptr]    
            left_ptr += 1
    
    return 0 if min_window == float('inf') else min_window

print(minSubArrayLen(7, [2, 3, 1, 2, 4, 3]))
print(minSubArrayLen(4, [1, 4, 4]))
print(minSubArrayLen(11, [1,1,1,1,1,1,1,1]))