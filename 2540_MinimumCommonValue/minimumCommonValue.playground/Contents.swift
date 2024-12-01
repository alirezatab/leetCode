import Foundation

// Time: o(n + m)
// space: o(1)
func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var i = 0
    var j = 0

    while i < nums1.count && j < nums2.count {
        if nums1[i] == nums2[j] {
            return nums1[i]
        } else if nums1[i] > nums2[j] {
            j += 1
        } else {
            i += 1
        }
    }
    return -1
}

print(getCommon([1, 2, 3], [4, 5, 6]))
print(getCommon([1, 2, 3], [2, 4]))
print(getCommon([1, 2, 3, 6], [2, 3, 4, 5]))

// there is a binary search way of doing it also. try that if you come across this problem
