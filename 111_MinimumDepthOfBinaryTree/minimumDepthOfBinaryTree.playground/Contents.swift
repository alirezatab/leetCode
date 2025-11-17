
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
dfs through three left and rigth
base case... if node is nil, return 0
otherwise add one + dfs

                3 1+ 1 = 2
            /       \
    1    9           20 1 + 1 = 2
                /       \
    ret 0    1  15          7 2
            ret 0           \
                            8 1
*/

func minDepth(_ root: TreeNode?) -> Int {
  
  func dfs(_ node: TreeNode?) -> Int {
    guard node != nil else { return 0 }
    
    if node?.left == nil {
      return 1 + dfs(node?.right)
    } else if node?.right == nil {
      return 1 + dfs(node?.left)
    }
    
    return 1 + min(dfs(node?.left), dfs(node?.right))
    //return min(1 + dfs(node?.left), 1 + dfs(node?.right))
  }
  
  return dfs(root)
}

