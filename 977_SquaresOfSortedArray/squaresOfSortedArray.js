var sortedSquares = function(nums) {
    const n = nums.length
    let left = 0
    let right = n - 1
    let res = new Array(n).fill(0)

    for(let i = n - 1; i >= 0; i--) {
        let square
        if (Math.abs(nums[left]) < Math.abs(nums[right])) {
            square = nums[right]
            right--
        } else {
            square = nums[left]
            left++
        }
        res[i] = square * square
    }
    return res
};