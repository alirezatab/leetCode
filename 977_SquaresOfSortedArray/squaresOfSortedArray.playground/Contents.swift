import Foundation
// for loop from end to begining, i
/*    l         r     // need a while loop or for loop to go through the array using
    [-4,-1,0,3,10]     // left and i pointer
    [-4,-1,0,3,100]       compare abs(-4) vs abs(10), square the larger and add it to
                i         that index. in this case right. then decrement right

 
       l      r
     [-4,-1,0,3,10] --> else if abs(l) > abs(r), left ++
     [-4,-1,0,16,100]
              i
 
        l  r
    [-4,-1,0,3,10] --> else if abs(l) <= abs(r), right --
    [-4,-1,9,16,100]
           i
 
 
 
      l           r
    [-5,-4,-3,-2,-1]
    [-5,-4,-3,-2,25]
 
        l         r
    [-5,-4,-3,-2,-1]
    [-5,-4,-3,16,25]
 
               l  r
    [-5,-4,-3,-2,-1]
    [-5,-4,9,16,25]
 
 var left = 0, right = nums.count - 1
 var res = Array(repeating: 0, count: nums.count)
 for through array from end to begining. --> i
    if abs(nums[l]) > abs(nums[r])
      resArr[i] = (nums[l] * nums[l])
      l += 1
    else
      resArr[i] = (nums[r] * nums[r])
      r -= 1
 */

// Time: o(n)
// space: o(1) since we dont count output array of res
func sortedSquares(_ nums: [Int]) -> [Int] {
  var left = 0
  var right = nums.count - 1
  var res = Array(repeating: 0, count: nums.count)
  for i in nums.indices.reversed() {
    if abs(nums[left]) > abs(nums[right]) {
      res[i] = (nums[left] * nums[left])
      left += 1
    } else {
      res[i] = (nums[right] * nums[right])
      right -= 1
    }
  }
  return res
}


print(sortedSquares([-4,-1,0,3,10]))
print(sortedSquares([-7,-3,2,3,11]))
print(sortedSquares([-5,-4,-3,-2,-1]))

// Time: o(n)
// space: o(1) since we dont count output array of res
func sortedSquaresRefactored(_ nums: [Int]) -> [Int] {
  var left = 0
  var right = nums.count - 1
  var res = Array(repeating: 0, count: nums.count)
  for i in nums.indices.reversed() {
    var square: Int
    if abs(nums[left]) > abs(nums[right]) {
      square = nums[left]
      left += 1
    } else {
      square = nums[right]
      right -= 1
    }
    res[i] = square * square
  }
  return res
}

print(sortedSquaresRefactored([-4,-1,0,3,10]))
print(sortedSquaresRefactored([-7,-3,2,3,11]))
print(sortedSquaresRefactored([-5,-4,-3,-2,-1]))
