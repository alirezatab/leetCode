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


func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
  var minDif = Double.infinity
  var sorted = [Int]()
  var result = Int.max
  
  func dfs(_ node: TreeNode?) {
    guard node != nil else { return }
    dfs(node!.left)
    sorted.append(node!.val)
    dfs(node!.right)
  }
  
  dfs(root)
  guard sorted.count > 1 else { return sorted[0] }
  
  for i in 1..<sorted.count {
    let dif1 = abs(Double(sorted[i]) - target)
    let dif2 = abs(Double(sorted[i - 1]) - target)
    if dif1 < minDif || dif2 < minDif {
      if dif1 == dif2 {
        result = min(sorted[i], sorted[i-1])
        minDif = dif1
      } else if dif1 < dif2 {
        result = sorted[i]
        minDif = dif1
      } else {
        result = sorted[i-1]
        minDif = dif2
      }
    }
  }
  
  return result
}
