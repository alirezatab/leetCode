import UIKit

class Solution {
    // Time: o(n log n)
    // space: o(1) or o(n) ... in this case o(n) since we are sorting and returning a new array
    func missingNumberSorted(_ nums: [Int]) -> Int {
        var sortedNums = nums.sorted()
        var expectedNumber = 0
        for index in 0...sortedNums.count {
            if sortedNums[index] != expectedNumber {
                return expectedNumber
            } else {
                expectedNumber += 1
            }
        }
        return -1
    }

    // Time: o(log n)
    // space: o(n)
    func missingNumberSet(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        var expectedNumber = 0
        for _ in 0...nums.count {
            if numSet.contains(expectedNumber) {
                expectedNumber += 1
            } else {
                return expectedNumber
            }
        }
        return -1
    }
    
    // Time: o(n)
    // space: o(1)
    // Bit Minuplation
    func missingNumber(_ nums: [Int]) -> Int {
        var expectedNumber = 0
        for _ in 0...nums.count {
            if numSet.contains(expectedNumber) {
                expectedNumber += 1
            } else {
                return expectedNumber
            }
        }
        return -1
    }
}
