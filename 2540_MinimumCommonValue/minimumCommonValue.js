// Time: o(n + m)
// space: o(1)
var getCommon = function(nums1, nums2) {
    let i = 0
    let j = 0

    while (i < nums1.length && j < nums2.length) {
    	if (nums1[i] === nums2[j]) {
    		return nums1[i]
    	} else if (nums1[i] < nums2[j]) {
    		i++
    	} else {
    		j++
    	}
    }
    return -1
};

console.log(getCommon([1, 2, 3], [4, 5, 6]))
console.log(getCommon([1, 2, 3], [2, 4]))
console.log(getCommon([1, 2, 3, 6], [2, 3, 4, 5]))

// there is a binary search way of doing it also. try that if you come across this problem