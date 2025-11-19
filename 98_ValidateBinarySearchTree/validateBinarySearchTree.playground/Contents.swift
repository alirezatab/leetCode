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
func isValidBSTrecrusive(_ root: TreeNode?) -> Bool {
  func dfs(_ node: TreeNode?, _ low: Int, _ high: Int) -> Bool {
    guard node != nil else { return true }
    
    if node!.val >= high || node!.val <= low {
      return false
    }
    
    let left = dfs(node?.left, low, node!.val)
    let right = dfs(node?.right, node!.val, high)
    
    return left && right
  }
  
  return dfs(root, Int.min, Int.max)
}

// Iterative
func isValidBST(_ root: TreeNode?) -> Bool {
  var stack = [(root, Int.min, Int.max)]
  
  while !stack.isEmpty {
    let (node, low, high) = stack.removeLast()
    
    if node!.val >= high || node!.val <= low {
      return false
    }
    
    if node?.left != nil {
      stack.append((node?.left, low, node!.val))
    }
    
    if node?.right != nil {
      stack.append((node?.right, node!.val, high))
    }
  }
  
  return true
}

