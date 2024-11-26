import Foundation
/*
 total = 0
 minValue = 0
   *             for loop through the array and do preSum and store value in total, then get the minVal
 [-3,2,-3,4,2]  total = -2, minVal = -3
     *
 [-3,2,-3,4,2]  total = -1, minVal = -3
 
       *
 [-3,2,-3,4,2]  total = -4, minVal = -4  minVal = min(total, minVal)
 
          *
 [-3,2,-3,4,2]  total = 0, minVal = -4  minVal = min(total, minVal)
 
           *
[-3,2,-3,4,2]  total = 2, minVal = -4  minVal = min(total, minVal)
 
 return is -(-4) + 1 = 5
 
 [1,2] minVal = 0, total 1, minVal = 0, total = 3 ... cause when numbers are positive, the first value 1 is the lowest positive number always
 return -0+1
 
 
 */
func minStartValue(_ nums: [Int]) -> Int {
  var total = 0
  var minVal = 0
  for num in nums {
    total += num
    minVal = min(total, minVal)
  }
  
  return -minVal + 1
}

print(minStartValue([-3,2,-3,4,2]))
print(minStartValue([1,2]))
print(minStartValue([1,-2,-3]))
