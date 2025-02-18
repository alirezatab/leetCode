import UIKit


func search(_ nums: [Int], _ target: Int) -> Int {
  var left = 0
  var right = nums.count - 1
  
  while left <= right {
    let mid = left + (right - left) / 2
    
    if nums[mid] == target {
      return mid
    }
    
    if nums[mid] >= nums[left] { // look into sorted left half
      if target >= nums[left] && target < nums[mid] {
        right = mid - 1
      } else {
        left = mid + 1
      }
    } else { // search the right half
      if target > nums[mid] && target <= nums[right] {
        left = mid + 1
      } else {
        right = mid - 1
      }
    }
  }
  return -1
}

print(search([4,5,6,7,0,1,2], 0)) // 4
print(search([4,5,6,7,0,1,2], 3)) // -1
print(search([1], 0)) // -1
print(search([5,6,7,8,0,1,2,3,4], 1))
