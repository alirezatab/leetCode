import Foundation

/*
 sum = 0
 nums = [1,12,-5,-6,50,3], k = 4   Highest sum will be the hishest average
         __________     for loop through begingin till k, get the sum = 2
 
 [1,12,-5,-6,50,3] for loop through k till the end of array
    -----------      sum += num[i] - num[i - k] => 51
                    max(ans, sum)
 
 [1,12,-5,-6,50,3] for loop through k till the end of array
       -----------      sum += num[i] - num[i - k] => 42
 
 
 store the max betwen newSum and the old Sum
 
*/

func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
  var sum = 0
  for i in 0..<k {
    sum += nums[i]
  }
  
  var ans = sum
  for i in k..<nums.count {
    sum += nums[i] - nums[i - k]
    ans  = max(ans, sum)
  }
  
  return Double(ans) / Double(k)
}

print(findMaxAverage([1,12,-5,-6,50,3], 4))
print(findMaxAverage([5], 1))
