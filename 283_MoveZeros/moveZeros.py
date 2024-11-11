class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        if len(nums) < 2:
            return
        i = 0
        j = 1
        while j < len(nums):
            while nums[j] == 0 and j < len(nums) - 1:
                j+=1
            while nums[i] != 0 and i < j and i < len(nums) - 1:
                i+=1
            
            nums[i], nums[j] = nums[j], nums[i]
            i+=1
            j+=1
        
print(moveZeroes([0,1,0,3,12]))
print(moveZeroes([0]))
print(moveZeroes([1,2]))