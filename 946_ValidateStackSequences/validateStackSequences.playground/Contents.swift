/*
        pushed = [1,2,3,4,5], popped = [4,5,3,2,1]
        poppedIndex = 0
 -----   looop through psuhed array
                       i                     pi
             pushed = [1,2,3,4,5], popped = [4,5,3,2,1]
             stack = [1]
            
            add it to the stack
            
                         i                   pi
             pushed = [1,2,3,4,5], popped = [4,5,3,2,1]
             stack = [1,2]
                           i                 pi
             pushed = [1,2,3,4,5], popped = [4 , 5,3,2,1]
             stack = [1,2, 3]

                             i               pi
             pushed = [1,2,3,4,5], popped = [4 , 5,3,2,1]
             stack = [1,2, 3, 4]

             while stack.top == poped[pi] {    stack = [1,2, 3]
                stack.pop                    pi
                pi += 1                 [4 , 5, 3,2,1]
             }

                               i                pi
             pushed = [1,2,3,4,5], popped = [4 , 5,3,2,1]
             stack = [1,2, 3, 5]

                               i                pi
             pushed = [1,2,3,4,5], popped = [4 , 5,3,2,1]
             stack = [1,2, 3]   popped = [4 , 5, pi3,2,1]
             stack = [1,2]   popped = [4 , 5, 3, pi2,1]

             return if stack,isEmpty

                                          i
             [1,2,3,4,5] Stack [1,2] [4,3,5,1,2]
*/


func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
  var stack = [Int]()
  var index = 0
  for num in pushed {
    stack.append(num)
    
    while let lastPushed = stack.last, lastPushed == popped[index] {
      stack.popLast()
      index += 1
    }
  }
  
  return stack.isEmpty
}

print(validateStackSequences([1,2,3,4,5], [4,3,5,1,2]))
print(validateStackSequences([1,2,3,4,5], [4,5,3,2,1]))
