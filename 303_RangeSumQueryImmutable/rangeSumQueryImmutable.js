/**
 * @param {number[]} nums
 */
var NumArray = function(nums) {
    let prefixSums = new Array(nums.length).fill(nums[0])
    for(let i = 1; i < nums.length; i++) {
    	prefixSums[i] = prefixSums[i - 1] + nums[i]
    }
};

/** 
 * @param {number} left 
 * @param {number} right
 * @return {number}
 */
NumArray.prototype.sumRange = function(left, right) {
    if (left === 0) {
    	return NumArray[right]
    }
    return NumArray[right] - NumArray[left - 1]
};

/** 
 * Your NumArray object will be instantiated and called as such:
 * var obj = new NumArray(nums)
 * var param_1 = obj.sumRange(left,right)
 */