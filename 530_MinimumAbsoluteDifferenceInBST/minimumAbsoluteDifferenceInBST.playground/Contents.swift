
// Definition for a binary tree node.
public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}
 
 // Time: o(n)
 // Space: o(n)
func getMinimumDifferenceRecrusive(_ root: TreeNode?) -> Int {
  var sortedNums = [Int]()
  var minDif = Int.max
  
  func dfs(_ node: TreeNode?) {
    guard node != nil else { return }
    
    dfs(node?.left)
    sortedNums.append(node!.val)
    dfs(node?.right)
  }
  
  dfs(root)
  /// at this point i did dfs and have sorted array of int
  for i in 1..<sortedNums.count {
    minDif = min(minDif, sortedNums[i] - sortedNums[i-1])
  }
  
  return minDif
}

    // Iterative
    /*                  cur         if  cur != nil, move it down to left child
                        4                 append cur not to stack  -> [4]
                    /       \             cur = cur.next
                    2       6
                /       \
                1       3
                var cur = root
                var values = []
                var stack = [int]()
                            while stack is not Empty or cur != nil
                        4       cur != nil, move it down to left child
                    /       \       append cur not to stack  -> [4, 2]
            cur    2       6        cur = cur.next
                /       \
                1       3

                        4       cur != nil, move it down to left child
                    /       \       append cur not to stack  -> [4, 2, 1]
                  2       6         cur = cur.next
                /       \
        cur    1       3

                        4       if cur != nil, move it down to left child
                    /       \
                  2       6     else
                /       \          let node = pop from stack -> s = [4,2]
             1       3              append node to values -> v = [1]
        cur                         cur = node.right
                
    */


 // Time: o(n)
 // Space: o(n) , best case is o(log n) since it holds the height of the tree. worst is skewed tree so o(n)
func getMinimumDifference(_ root: TreeNode?) -> Int {
  var cur = root
  var values = [Int]()
  var stack = [TreeNode]()
  
  while !stack.isEmpty || cur != nil {
    if cur != nil  {
      stack.append(cur!)
      cur = cur?.left
    } else {
      let parentNode = stack.removeLast()
      values.append(parentNode.val)
      cur = parentNode.right
    }
  }
  
  var minDif = Int.max
  for i in 1..<values.count {
    minDif = min(minDif, values[i] - values [i - 1])
  }
  return minDif
}
    
 // Time: o(n)
 // Space: o(n)
func getMinimumDifferenceDOAgainIterertavely(_ root: TreeNode?) -> Int {
  guard root != nil else { return 0 }
  var minDif = Int.max
  
  func iterativeInOrder(_ root: TreeNode?) -> [Int] {
    var stack = [TreeNode]()
    var values = [Int]()
    var curNode = root
    
    while !stack.isEmpty || curNode != nil {
      if curNode != nil {
        stack.append(curNode!)
        curNode = curNode?.left
      } else {
        curNode = stack.popLast()
        values.append(curNode!.val)
        curNode = curNode?.right
      }
    }
    return values
  }
  
  let sortedNums = iterativeInOrder(root)
  /// at this point i did dfs and have sorted array of int
  for i in 1..<sortedNums.count {
    minDif = min(minDif, sortedNums[i] - sortedNums[i-1])
  }
  
  return minDif
}
