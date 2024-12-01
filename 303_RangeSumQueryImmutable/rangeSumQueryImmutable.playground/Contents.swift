import Foundation
// Time: o(n) for precomputation, o(1) for time per query
//o(1) for sumRange query
// space: o(n)

// pre calculate the prefix sum of each index and add it to the array
// so prefix sum arr will be Optional([-2, -2, 1, -4, -2, -3])

//Input ["NumArray", "sumRange", "sumRange", "sumRange"]
// [[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
//Output [null, 1, -1, -3]
class NumArray {
  
  var prefixSumArr: [Int]!
  
  init(_ nums: [Int]) {
    prefixSumArr = Array(repeating: 0, count: nums.count)
    prefixSumArr[0] = nums[0]
    for i in 1..<nums.count {
      prefixSumArr[i] = nums[i] + prefixSumArr[i - 1]
    }
  }
  
  func sumRange(_ left: Int, _ right: Int) -> Int {
    if left == 0 {
      return prefixSumArr[right]
    }
    return prefixSumArr[right] - prefixSumArr[left - 1]
  }
}
