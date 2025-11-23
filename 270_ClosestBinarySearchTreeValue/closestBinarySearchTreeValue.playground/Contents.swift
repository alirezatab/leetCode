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
    first do dfs of in order of BST -> so you get [1,2,3,4,5]
    then go from begining to end
     i                  dif = Int.max, res = 0
    [1,2,3,4,5] target - val @ i = 2.7 == new Dif --> if newDif < dif, update dif, update res
                dif = 2.7, res = 1

       i                  dif = 1.7, res = 1
    [1,2,3,4,5] 3.7 - 2 = 1.7 == new Dif --> if newDif < dif, update dif == 1.7, update res == 2

         i                  dif = 1.7, res = 2
    [1,2,3,4,5] 3.7 - 3 = 0.7 == new Dif --> if newDif < dif, update dif == 0.7, update res == 3

           i                  dif = 0.7, res = 3
    [1,2,3,4,5] abs(3.7 - 4) = 0.3 == new Dif --> if newDif < dif, update dif == 0.3, update res == 4

             i                  dif = 0.3 res = 4
    [1,2,3,4,5] abs(3.7 - 5) = 1.3 == new Dif --> if newDif > dif, no update

    now what happens if target is 3.5, so then at 3 and 4, we get equal values

         i
    [1,2,3,4,5] abs(3.5 - 3) = 0.5 == new Dif --> if newDif < dif, update

           i
    [1,2,3,4,5] abs(3.5 - 3) = 0.5 == new Dif --> if newDif >= dif, no update
*/

// Simplicity & correctness: The first function is better — it's cleaner, easier to understand, and just as efficient.
// Time: o(n)
// Space: o(n)
func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
  var inOrderBst = [Int]()
  
  func dfs(_ node: TreeNode?) {
    guard node != nil else { return }
    dfs(node?.left)
    inOrderBst.append(node!.val)
    dfs(node?.right)
  }
  dfs(root)
  
  var dif = Double.infinity
  var result = 0
  for num in inOrderBst {
    let newDif = abs(target - Double(num))
    if newDif < dif {
      dif = newDif
      result = num
    }
  }
  
  return result
}

// Second function adds complexity without benefit — and has potential edge-case bugs (e.g., single-node tree handling is okay due to the guard, but logic is overcomplicated).
func closestValueMoreComplicated(_ root: TreeNode?, _ target: Double) -> Int {
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
