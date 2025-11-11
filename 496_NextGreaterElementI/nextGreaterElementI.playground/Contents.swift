
func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
  var stack = [Int]()
  var dict = [Int: Int]()
  var result = Array(repeating: -1, count: nums1.count)
  
  for num in nums2 {
    while let lastNum = stack.last, lastNum < num {
      stack.popLast()
      dict[lastNum] = num
    }
    stack.append(num)
  }
  
  // return nums1.map { greaterMap[$0] ?? -1 }
  
  for i in 0..<nums1.count {
    result[i] = dict[nums1[i]] ?? -1
  }
  
  return result
}

print(nextGreaterElement([4,1,2], [1,3,4,2]))
print(nextGreaterElement([2,4], [1,2,3,4]))
