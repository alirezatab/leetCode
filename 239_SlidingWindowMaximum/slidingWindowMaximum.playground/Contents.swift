/*
 arr for res = [Int]()
 var left = 0
 var decreasingMonotonicStack = [Int]()
 loop through the array, if array is noe, empty or violates the decreasingMonotonicStack conditon, pop
 then add to stck (Fifo)
 l
 r
 [1,3,-1,-3,5,3,6,7], decreasingMonotonicStack = [1]
 
 l r
 [1,3,-1,-3,5,3,6,7], decreasingMonotonicStack = [1] so stack is not empty and stack.first < arr[r]
 so, dequeue 1 -> []
 then enque to stack -> decreasingMonotonicStack = [3]
 
 l    r
 [1,3,-1,-3,5,3,6,7], decreasingMonotonicStack = [3, -1] so while statement wont hit
 then enque to stack -> decreasingMonotonicStack = [3, -1]
 
 at this point we have have a valid window
 so we need to add the max to the result -> max is first item of the stack
 
 if right - left + 1 == k {
 res.append(decreasingMonotonicStack.first) --> res = [3]
 if nums[left] == decreasingMonotonicStack.first {
 deququ decreasingMonotonicStack
 }
 left += 1
 l  r
 [1,3,-1,-3,5,3,6,7]
 }
 
 l     r
 [1,3,-1,-3,5,3,6,7], decreasingMonotonicStack = [3, -1] so while statement wont hit
 then enque to stack -> decreasingMonotonicStack = [3, -1, -3], res = [3,3]
 
 l     r
 [1,3,-1,-3,5,3,6,7], decreasingMonotonicStack = [3, -1] so while statement wont hit
 then enque to stack -> decreasingMonotonicStack = [3, -1, -3], res = [3,3]
 since nums[left] == decreasingMonotonicStack.first, we dequeeu --> [-1, -3] ->
 l   r
 [1,3,-1,-3,5,3,6,7]
 
 l     r
 [1,3,-1,-3,5,3,6,7], decreasingMonotonicStack = [3, -1, -3] so it violates -> decreasingMonotonicStack =  [5]
 l r            res = [3,3, 5]
 [1,3,-1,-3,5,3,6,7]
 
 l    r
 [1,3,-1,-3,5,3,6,7], decreasingMonotonicStack = [5] so it doesnt violate -> decreasingMonotonicStack =  [5, 3]
 l r            res = [3,3, 5, 5]
 [1,3,-1,-3,5,3,6,7]
 
 l   r
 [1,3,-1,-3,5,3,6,7], decreasingMonotonicStack = [5, 3] so it violate so we pop-> decreasingMonotonicStack =  []
 then we append [6]
 l r            res = [3,3, 5, 5, 6]
 [1,3,-1,-3,5,3,6,7]
 */


func maxSlidingWindowMyVersion(_ nums: [Int], _ k: Int) -> [Int] {
  var left = 0, answer = [Int](), decreasingMonotonicQueue = [Int]()
  for right in 0..<nums.count {
    while let prevMaxIndex = decreasingMonotonicQueue.last,
          nums[prevMaxIndex] < nums[right] {
      // dequeue
      decreasingMonotonicQueue.removeLast()
    }
    decreasingMonotonicQueue.append(right)
    
    if right - left + 1 == k {
      answer.append(nums[decreasingMonotonicQueue[0]])
      if left == decreasingMonotonicQueue[0] {
        decreasingMonotonicQueue.removeFirst()
      }
      left += 1
    }
  }
  
  return answer
}

print(maxSlidingWindowMyVersion([1,3,-1,-3,5,3,6,7], 3))
print(maxSlidingWindowMyVersion([1], 1))
print(maxSlidingWindowMyVersion([1,3,1,2,0,5], 3))

func maxSlidingWindowFromLeetCodeCourse(_ nums: [Int], _ k: Int) -> [Int] {
  var answer = [Int](), decreasingMonotonicQueue = [Int]()
  
  for right in 0..<nums.count {
    while let prevMaxIndex = decreasingMonotonicQueue.last,
          nums[prevMaxIndex] < nums[right] {
      // dequeue
      decreasingMonotonicQueue.removeLast()
    }
    decreasingMonotonicQueue.append(right)
    
    // queue[0] is the index of the maximum element.
    // if queue[0] + k == i, then it is outside the window
    
    //both of the below if statement work, the commented out one and the commented one
    // if decreasingMonotonicQueue[0] + k == right {
    if decreasingMonotonicQueue[0] <= right - k {
      decreasingMonotonicQueue.removeFirst()
    }
    
    // only add to the answer once our window has reached size k
    if (right >= k - 1) {
      answer.append(nums[decreasingMonotonicQueue[0]])
    }
  }
  
  return answer
}

print(maxSlidingWindowFromLeetCodeCourse([1,3,-1,-3,5,3,6,7], 3))
print(maxSlidingWindowFromLeetCodeCourse([1], 1))
print(maxSlidingWindowFromLeetCodeCourse([1,3,1,2,0,5], 3))
