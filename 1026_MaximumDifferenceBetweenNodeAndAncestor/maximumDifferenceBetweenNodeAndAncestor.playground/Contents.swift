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
Min & max Val at each node....
                    8               min = 8, max = 8 traverse dfs, left first maxDif = 0
                /       \           min = 3, max = 8 , maxDif = 5
            3           10          min = 1, max = 8, maxdif = 7
        /       \           \
        1       6           14      pop bac to 3, and go right... min = 3, max = 8 , maxDif = 5
            /       \       /       we are at 6, since max or min didnt change. dont need to take the
            4       7      13       max Dif
                                    and that continues down

                                    on the right side,
                                    min = 8, max = 10 traverse dfs, right first newDif = 2
                                    so take the max(maxDif, newDif) == 7
                                    on the right side,
                                    min = 8, max = 14 traverse dfs, right first newDif = 6
                                    so take the max(maxDif, newDif) == 7

                                    on the left side,
                                    min = 8, max = 14 less than max so we dont do anything
    min --> root.val
    max --> root.val
    
    dfs
        left
        right
        

*/

// Time: o(n)
// Space: o(n)
func maxAncestorDiffBruteForce(_ root: TreeNode?) -> Int {
  var maxDif = 0
  
  func dfs(_ node: TreeNode?, _ minVal: Int, _ maxVal: Int) {
    guard node != nil else { return }
    
    let newMin = min(minVal, node!.val)
    let newMax = max(maxVal, node!.val)
    maxDif = max(maxDif, newMax - newMin)
    
    dfs(node?.left, newMin, newMax)
    dfs(node?.right, newMin, newMax)
  }
  
  dfs(root, Int.max, Int.min)
  return maxDif
}

/*
dfs through tree and keep track of min and max
                    8               min 8, max 8
                /       \
            3           10          min 3, max 8
        /       \           \
        1       6           14      min 1, max 8
            /       \       /
            4       7      13       nodeLeft = nil && nodeRight = nil --> return max - min

            traverse left and right
            when returning , we want to return the maxval so we take max of left and right nodes at each level
*/

// Time: o(n)
// Space: o(n)
func maxAncestorDiff(_ root: TreeNode?) -> Int {
  
  func dfs(_ node: TreeNode?, _ maxVal: Int, _ minVal: Int) -> Int {
    guard node != nil else { return maxVal - minVal }
    
    let curMin = min(minVal, node!.val)
    let curMax = max(maxVal, node!.val)
    
    let left = dfs(node?.left, curMax, curMin)
    let right = dfs(node?.right, curMax, curMin)
    
    return max(left, right)
  }
  
  return dfs(root, Int.min, Int.max)
}

