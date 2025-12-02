
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
dfs -> left, right.. if both left and right is nil, we are at leaf
only then append to result
other wise keep traversing
 */
 // Time: o(n + m)
 // Space: o(n + m)
func leafSimilarTrueDFSWay(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    func dfs(_ node: TreeNode?) -> [Int] {
        guard node != nil else { return [ ] }
        // we have a leaf node
        if node!.left == nil && node!.right == nil {
            return [node!.val]
        }
        return dfs(node?.left) + dfs(node?.right)
    }

    var tree1Leaves = dfs(root1)
    var tree2Leaves = dfs(root2)

    guard tree1Leaves.count == tree2Leaves.count else { return false }

    for (leaf1, leaf2) in zip(tree1Leaves, tree2Leaves) {
        if leaf1 != leaf2 {
            return false
        }
    }

    return true
}


func leafSimilarMyWay(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
  
  var tree1Leaves = [Int]()
  var tree2Leaves = [Int]()
  
  func dfs(_ node: TreeNode?, _ ans: inout [Int]) {
    guard node != nil else { return }
    // we have a leaf node
    if node!.left == nil && node!.right == nil {
      ans.append(node!.val)
    }
    dfs(node?.left, &ans)
    dfs(node?.right, &ans)
  }
  
  dfs(root1, &tree1Leaves)
  dfs(root2, &tree2Leaves)
  
  guard tree1Leaves.count == tree2Leaves.count else { return false }
  
  for (leaf1, leaf2) in zip(tree1Leaves, tree2Leaves) {
    if leaf1 != leaf2 {
      return false
    }
  }
  
  return true
}
