
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
if only root, depth = 1
based case is if node is nil return 0
I can go left and right
                3 max(1,or 2) + 1 == 3
       ret 1  /      \ ret 2
        1+0 9       20 1+1
      ret0 / \    /       \ ret 1
         nil nil  5        7 0 + 1
*/


func maxDepth(_ root: TreeNode?) -> Int {
  guard root != nil else { return 0 }
  
  let left = maxDepth(root?.left)
  let right = maxDepth(root?.right)
  
  return max(left, right) + 1
}

