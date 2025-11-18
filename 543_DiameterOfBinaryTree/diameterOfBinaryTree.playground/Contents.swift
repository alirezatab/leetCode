//Definition for a binary tree node.
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
func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
  var maxDiam = 0
  
  func dfsTraversal(node: TreeNode?) -> Int {
    guard node != nil else { return 0 }
    
    
    let leftHeight = dfsTraversal(node: node!.left)
    let rightHeight = dfsTraversal(node: node!.right)
    
    maxDiam = max(maxDiam, leftHeight + rightHeight)
    
    return 1 + max(leftHeight, rightHeight)
  }
  
  dfsTraversal(node: root)
  return maxDiam
}
