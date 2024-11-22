import Foundation

func runningSum(_ nums: [Int]) -> [Int] {
  var res = nums
  for i in 1..<res.count {
    res[i] += res[i - 1]
  }
  return res
}


print(runningSum([1,2,3,4])) // [1,3,6,10]
print(runningSum([1,1,1,1,1])) // [1,2,3,4,5]
print(runningSum([3,1,2,10,1])) // [3,4,6,16,17]

