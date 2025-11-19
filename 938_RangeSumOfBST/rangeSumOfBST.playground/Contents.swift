
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
            10   if this is in rage, i can add it to the sum == 10
            /\
           5  15  if node.left != nil
           /\  \    sum += BST(node.left)
          3 7   18  if node.right != nil
                        sum += BST(node.right)
*/
 
// TIme: o(n)
// Space: o(n) or o(h)
// This is more efficient though than the below one cause of pruning even though the worst case is the same. we ignore part of the tree where the
func rangeSumBSTTry1(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
  var sum = 0
  func traverse(node: TreeNode?) {
    guard let n = node else { return }
    if n.val >= low && n.val <= high {
      sum += n.val
      traverse(node: n.left)
      traverse(node: n.right)
    }
    
    // pruning part where it skips entire subtree
    if n.val < low {
      traverse(node: n.right)
    }
    
    if n.val > high {
      traverse(node: n.left)
    }
    
  }
  
  traverse(node: root)
  return sum
}

// TIme: o(n)
// Space: o(n)
func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
  guard root != nil else { return 0 }
  var sum = 0
  
  if root!.val >= low && root!.val <= high {
    sum += root!.val
  }
  if root!.left != nil {
    sum += rangeSumBST(root!.left, low, high)
  }
  
  if root!.right != nil {
    sum += rangeSumBST(root!.right, low, high)
  }
  
  return sum
}

/*
            root == 10  sum = 10 + 7
            left, right = TreeNode?
            left, right = root
            10
            /\
           5  15
           /\  \
          3 7   18

        //   check if runner is >= 7 or <= 15 --> 10
        //     runner = runner.left
        // while left != nil && right != nil
            check its value --> 5
            if >= 7 or <= 15 --> 10, noe
                add to the sum --> 10 + 7
                move to left if not nil or <= 7
                move to the right if >=15
            else
                runner = runner.right
 */
