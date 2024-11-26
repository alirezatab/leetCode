import Foundation

/*
 var ans which is the max vs old window
 since i will move one to the right everytime, we r is the forloop
 end of each for loop step, get the max (ans, right - left + 1)
         l
         r
 nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2  if nums[r] == 0 , else continue, i = 0
        l
          r
nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2  if nums[r] == 0 , else continue, i = 1
        l
              r
nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2 i = 2 then 3 so we have if nums[r] == 0
                                        k -= 1, then continue... k => 1
                                        while k < 0 ... do something
 
        l       r
nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2, i = 4 have if nums[r] == 0
                                       k -= 1, then continue... k => 0
                                       while k < 0 ... do something
 
        l         r
nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2, i = 4 have if nums[r] == 0
                                       k -= 1, then continue... k => -1
                                       while k < 0
                                          if num[l] == 0, k+=1
                                          left++
 
                  l         r
nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2, i = 4 have if nums[r] == 0
                                k -= 1, then continue... k => -1
                                while k < 0
                                   if num[l] == 0, k+=1  k => 0
                                   left++
 */

// Time: o(n)
// space: o(1)
func longestOnes(_ nums: [Int], _ k: Int) -> Int {
  var left = 0
  var ans = 0
  var kCopy = k
  
  for right in 0..<nums.count {
    if nums[right] == 0 {
      kCopy -= 1
      
      while kCopy < 0 {
        if nums[left] == 0 {
          kCopy += 1
        }
        left += 1
      }
    }
    
    ans = max(ans, right - left + 1)
  }
  
  return ans
}

print(longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2))
print(longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3))

/*
// Leetcode solution
class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var kCopy = k
        var r = 0
        
        for right in 0..<nums.count {
            kCopy -= 1 - nums[right]
            if kCopy < 0 {
                kCopy += 1 - nums[left]
                left += 1
            }
            r = right
        }
        return r - left + 1
    }
}
*/
