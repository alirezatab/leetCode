var moveZeroes = function(nums) {
    if (nums.length < 2) { return }
    let i = 0
    let j = 1

    while (j < nums.length) {
        while (nums[j] == 0 && j < nums.length - 1) {
            j++
        }
        while (nums[i] != 0 && i < j && i < nums.length - 1) {
            i++
        }

        [nums[i], nums[j]] = [nums[j], nums[i]]
        i++
        j++
    }
};

console.log(moveZeroes([0,1,0,3,12]))
console.log(moveZeroes([0]))
console.log(moveZeroes([1,2]))