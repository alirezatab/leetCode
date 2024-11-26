var minStartValue = function(nums) {
    let minVal = 0
    let total = 0

    for(let i = 0; i < nums.length; i++) {
    	total += nums[i]
    	minVal = Math.min(minVal, total)
    }

    return -minVal + 1
};

console.log(minStartValue([-3,2,-3,4,2]))
console.log(minStartValue([1,2]))
console.log(minStartValue([1,-2,-3]))