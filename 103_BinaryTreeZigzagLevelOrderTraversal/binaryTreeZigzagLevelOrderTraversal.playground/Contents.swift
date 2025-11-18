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
either toggle with flag or odd is left to right and even is right to left
var result = []

                3      QUEUE[3] --> LEFT TO right --> so if odd, just append the queue -> [[3]]
            /       \ QUEUE[9, 20] righgt to left --> if even, reverse the queue and append
        9           20      [[3], [20, 9]]
                /       \
                15      7

    var re [[Int]]
    add root to queue
    var level = 1
    
    while !queu.isEmpty
        get count of nodes in that level

        // here
        if level is odd
            append queue to result
        else {
            appened reverse queue to result // maybe turn queue into stack
        }
    
        loop through 0 < count
            remove first item of queue and save it in a node variable
            
            if left is not nil, add left to queue
            if right in not nil, add righ to the queue
*/
// Time: o(n)
//For each level, we do:
// queue.map { ... } → processes all nodes in current level
// .reversed() on that level → also O(m) where m = number of nodes in the level
// Space: o(w) where w is the max width of a level... ar worst, it will be o(n) in a complete binary tree where w = n/2 == n

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
  guard root != nil else { return [ ] }
  var queue = [root]
  var res = [[Int]]()
  var level = 1
  
  while !queue.isEmpty {
    let count = queue.count
    
    if level % 2 == 1 {
      res.append(queue.compactMap { $0?.val })
    } else {
      res.append(queue.compactMap { $0?.val }.reversed())
    }
    
    for _ in 0..<count {
      let node = queue.removeFirst()
      
      if node?.left != nil {
        queue.append(node!.left)
      }
      
      if node?.right != nil {
        queue.append(node!.right)
      }
    }
    
    level += 1
  }
  
  return res
}
