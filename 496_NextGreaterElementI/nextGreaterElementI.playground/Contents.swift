/*
    nums1 = [4,1,2], nums2 = [1,3,4,2]

    map the number to the next grater element
    {1:3, 3: 4, 4: -1, 2: -1} --> monotonic Stack cause you care about current price - the last parice

    monotonic Incereasing didnt work
    monotonic non-increasing didnt work
    [1]
    [1] -> check the top, if 1 < 3 --> then add to map {top of stack(key): cur(value)}
    pop
    stack = {1:3} => stack = []
    append stack = [3]

    [3]-> check the top, if 3 < 4 --> pop, then add to map {top of stack(key): cur(value)}
    stack = {1:3, 3:4}
    then append stack = [4]
    
    [4] -> check the top, if 4 is not < 2 --> so we append to stack
    [4, 2]

    var res = []
             i
    nums1 = [4,1,2] {1:3, 3:4} --> no 4, append -1
    
    var res = [-1]
               i
    nums1 = [4,1,2] {1:3, 3:4} --> yes 1, append 3

    var res = [-1, 3, -1]
                 i
    nums1 = [4,1,2] {1:3, 3:4} --> no 2, append -1
    reurtn res

    var result
    for loop through nums1
    if key existsi, append value to result
    else append -1
*/

// Time: o(n) --> nums2 = n, nums1 = m, sinc m is a subset of n, we can say m < n so we just say n
// space: o(n)
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
