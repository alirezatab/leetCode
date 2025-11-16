
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
 curSum == target --> return tre

 travese left
 traverse right
                        5  curSum = 5
                    /       \
                    4       8 curSum = 9
                /          / \
            11          13      4 curSum = 20
        /       \                 \
       7         2                  1 curSum = 27 return fase
       base case nil return false

                               5  l -> curSum = 5
                    /       \
                    4       8 l -> curSum = 9
                /          / \
            11          13      4 l -> curSum = 20
        /       \                 \
       7         2                  1 curSum = 22 return tue
       base case nil return false

       as long as I get one true, I have found the path
       when we are at the leaf node we check the sum against the target
 */


// Time: o(n) we need to traverse through all the node
// space: o(n) if the tree was a straing line at worst case
func hasPathSumRecrusive(_ root: TreeNode?, _ targetSum: Int) -> Bool {
  
  func dfs(_ node: TreeNode?, _ curSum: Int) -> Bool {
    guard node != nil else { return false }
    
    if node?.left == nil && node?.right == nil {
      return (curSum + node!.val) == targetSum
    }
    let left = dfs(node?.left, curSum + node!.val)
    let right = dfs(node?.right, curSum + node!.val)
    
    return left || right
  }
  
  return dfs(root, 0)
}

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
  guard root != nil else { return false }
  var stack = [(root, 0)]
  
  while !stack.isEmpty {
    let (node, curSum) = stack.removeLast()
    
    // we are on a leaf
    if node?.left == nil && node?.right == nil {
      if (curSum + node!.val) == targetSum {
        return true
      }
    }
    
    if node?.left != nil {
      stack.append((node!.left, curSum + node!.val))
    }
    
    if node?.right != nil {
      stack.append((node!.right, curSum + node!.val))
    }
  }
  
  return false
}

