def sortedSquares(nums: List[int]) -> List[int]:
    n = len(nums)
    left = 0
    right = n - 1
    res = [0] * n

    for i in range(n - 1, -1, -1):
        if abs(nums[left]) < abs(nums[right]):
            square = nums[right]
            right -= 1
        else:
            square = nums[left]
            left += 1
        res[i] = square * square
    
    return res

print(sortedSquares([-4,-1,0,3,10]))
print(sortedSquares([-7,-3,2,3,11]))