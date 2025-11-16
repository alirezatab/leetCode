
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
 
/*
    what do we know.
    if p == nil && p == nil return true
    if p == nil || p != nil return flase
    
    so if we have this == and root is always the same, then we early terminaeted. so we say if not equal, reutrn false... if == then we continue the traverse
    if p.val == q.val --> return true, if not return false


    traverse the nodes
*/

// Time: o(n)
// Space: o(n)
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
  if p == nil && q == nil { return true }
  if p == nil || q == nil { return false }
  
  if p?.val != q?.val { return false }
  
  return isSameTree(p!.left, q?.left) && isSameTree(p!.right, q?.right)
}
