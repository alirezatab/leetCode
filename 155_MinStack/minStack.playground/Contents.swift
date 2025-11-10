/*
    if stack is empty, add to both stacks
    stack = [-2]
    minStack = [-2]

    if stack is not empty, push value to stack
    stack = [-2, 0]
    for min stack, compare top to canditate number to being pushed
        if canditate number to being pushed < minStack.top, append numm candidate
    minStack = [-2]

    stack = [-2, 0, -3]
    minStack = [-2, -3]

    when poping...
    pop from stack...if value in stack is the same value as top of the min stack
    pop the min stack too

*/

class MinStack {
  
  var stack: [Int]
  var minStack: [Int]
  
  init() {
    stack = [ ]
    minStack = [ ]
  }
  
  func push(_ val: Int) {
    stack.append(val)
    
    if let lastMin = minStack.last, lastMin >= val {
      minStack.append(val)
    } else if minStack.isEmpty {
      minStack.append(val)
    }
  }
  
  func pop() {
    let lastNum = stack.popLast()
    if let lastMinNum = minStack.last, lastMinNum == lastNum {
      minStack.popLast()
    }
  }
  
  func top() -> Int {
    stack[stack.count - 1]
  }
  
  func getMin() -> Int {
    minStack[minStack.count - 1]
  }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
