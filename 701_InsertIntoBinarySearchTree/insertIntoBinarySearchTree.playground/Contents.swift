
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
 

/*
        need to traverse the tree
    
    dfs -> pass root
        if node is nil

        so check val aginst root / node, if val < node.val...
            let left = dfs(node.left)
        else
            let right = dfs(node.right)
            if right == 0, node.right = val

                            4
                        /       \
                        2       7
                    /       \    return Bool... then add the node to that side
                    1        3
*/

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
  guard root != nil else { return TreeNode(val) }
  
  func dfs(_ node: TreeNode?) -> Bool {
    guard node != nil else { return true }
    
    if val < node!.val {
      if dfs(node?.left) {
        node?.left = TreeNode(val)
      }
    } else {
      if dfs(node?.right) {
        node?.right = TreeNode(val)
      }
    }
    
    return false
    
  }
  dfs(root)
  return root
}
