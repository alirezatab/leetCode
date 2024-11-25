var getAverages = function(nums, k) {
    let preSum = [...nums]
    let divisor = (k*2)+1

    for (let i = 1; i < nums.length; i++) {
        preSum[i] += preSum[i - 1]
    }

    for (let i = 0; i < nums.length; i++) {
        if (i + k >= nums.length || i - k < 0) {
            nums[i] = -1
        } else if (i - k == 0) {
            nums[i] = Math.floor(preSum[i + k] / divisor)
        } else {
            nums[i] = Math.floor((preSum[i + k] - preSum[i - k - 1]) / divisor)
        }
    }

    return nums
};

console.log(getAverages([7,4,3,9,1,8,5,2,6], 3))
console.log(getAverages([100000], 0))
console.log(getAverages([8], 100000))