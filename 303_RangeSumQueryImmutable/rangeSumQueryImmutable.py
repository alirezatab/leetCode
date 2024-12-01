class NumArray:

    def __init__(self, nums: List[int]):
        self.prefixSumArr = [0] * len(nums)
        self.prefixSumArr[0] = nums[0]
        for i in range(1, len(nums)):
            self.prefixSumArr[i] = nums[i] + self.prefixSumArr[i - 1]

    def sumRange(self, left: int, right: int) -> int:
        if left == 0:
            return self.prefixSumArr[right]
        return self.prefixSumArr[right] - self.prefixSumArr[left - 1]


# Your NumArray object will be instantiated and called as such:
# obj = NumArray(nums)
# param_1 = obj.sumRange(left,right)