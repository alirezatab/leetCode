
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

func deepestLeavesSum(_ root: TreeNode?) -> Int {
  guard root != nil else { return 0 }
  var queue = [root]
  var res = 0
  
  while !queue.isEmpty {
    let numOfNodesInLevel = queue.count
    res = 0
    
    for _ in 0..<numOfNodesInLevel {
      let node = queue.removeFirst()
      res += node!.val
      if node?.left != nil {
        queue.append(node?.left)
        
      }
      
      if node?.right != nil {
        queue.append(node?.right)
      }
    }
  }
  return res
}
