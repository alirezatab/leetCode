var minSubArrayLen = function(target, nums) {
    let sum = 0
    let minWindow = Infinity
    let leftPtr = 0

    for (let rightPtr = 0; rightPtr < nums.length; rightPtr++) {
        sum += nums[rightPtr]
        while (sum >= target) {
            var curWindow = rightPtr - leftPtr + 1
            minWindow = Math.min(minWindow, curWindow)
            sum -= nums[leftPtr]    
            leftPtr += 1
        }
    }
    return minWindow == Infinity ? 0 : minWindow
};

console.log(minSubArrayLen(7, [2, 3, 1, 2, 4, 3]))
console.log(minSubArrayLen(4, [1, 4, 4]))
console.log(minSubArrayLen(11, [1,1,1,1,1,1,1,1]))