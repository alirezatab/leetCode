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

var getAverages2 = function(nums, k) {
    if (k === 0) {
        return nums
    }
    const windowSize = (k * 2) + 1
    const averages = new Array(nums.length).fill(-1)

    if (windowSize > nums.length) {
        return averages
    }

    let windowSum = 0
    for (let i = 0; i < windowSize; i++) {
        windowSum += nums[i]
    }

    averages[k] = Math.floor(windowSum / windowSize)

    for(let i = windowSize; i < nums.length; i++) {
        windowSum += nums[i] - nums[i - windowSize]
        averages[i - k] = Math.floor(windowSum / windowSize)
    }

    return averages
};

console.log(getAverages2([7,4,3,9,1,8,5,2,6], 3))
console.log(getAverages2([100000], 0))
console.log(getAverages2([8], 100000))