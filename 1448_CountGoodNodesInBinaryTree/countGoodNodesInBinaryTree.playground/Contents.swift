
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
 

func goodNodes(_ root: TreeNode?) -> Int {
  
  func dfs(_ node: TreeNode?, _ maxSeen: Int) -> Int {
    guard node != nil else { return 0 }
    
    let left = dfs(node?.left, max(maxSeen, node!.val))
    let right = dfs(node?.right, max(maxSeen, node!.val))
    var ans = left + right
    if node!.val >= maxSeen {
      ans += 1
    }
    
    return ans
  }
  
  return dfs(root, Int.min)
}

