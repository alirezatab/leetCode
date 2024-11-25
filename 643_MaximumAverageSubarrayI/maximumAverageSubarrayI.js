var findMaxAverage = function(nums, k) {
	let sum = 0
	for (let i = 0; i < k; i++) {
		sum += nums[i]
	}

	let ans = sum
	for (let i = k; i < n; i++) {
		sum += num[i] - nums[i - k]
		ans = Math.max(ans, sum)
	}

	return ans / k
}

console.log(findMaxAverage([1,12,-5,-6,50,3], 4))
console.log(findMaxAverage([5], 1))