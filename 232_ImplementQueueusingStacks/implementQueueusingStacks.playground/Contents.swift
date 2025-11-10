class MyQueue {
  
  var stack: [Int]
  var stackQueue: [Int]
  
  init() {
    stack = [ ]
    stackQueue = [ ]
  }
  
  func push(_ x: Int) {
    stack.append(x)
  }
  
  func pop() -> Int {
    if !stackQueue.isEmpty {
      return stackQueue.popLast()!
    }
    
    convertStackToStackQueue()
    return stackQueue.popLast() ?? -1
  }
  
  func peek() -> Int {
    guard let firstVal = stackQueue.last else {
      convertStackToStackQueue()
      return stackQueue.last ?? 0
    }
    
    return firstVal
  }
  
  func empty() -> Bool {
    stackQueue.isEmpty && stack.isEmpty
  }
  
  private func convertStackToStackQueue() {
    while let lastNum = stack.last {
      stackQueue.append(lastNum)
      stack.popLast()
    }
    /*
     // can also be done this way
     while !stack.isEmpty {
        stackQueue.append(stack.popLast()!)
     }
     */
  }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
