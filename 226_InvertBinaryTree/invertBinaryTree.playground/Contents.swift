
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

temo = node.left
node.left = node.right
node.right = temp

        BFS -> queue = [4]
        whiel queue is not emptuy
            let count = queue.count -> 1
            dequeue -> 4
            
temo = node.left
node.left = node.right
node.right = temp

            for i in count
                push to queue(leftChild)
                push to queue(rightChild)


        ->[4], count = 1, dequeue 4, swap, newQueye = [7,2]

                4
            /       \
            7       2       do swap
        /      \  /    \
        6       9 1     3
        -> [7,2], count = , dequeue 7, swap, newQ = [2,9,6]
                4
            /       \
            7       2       do swap
        /      \  /    \
        9       6 1     3
        [4]

        -> [2,9,6], dequeue 2, swap, newQ = [9,6, 3, 1]

                 4
            /       \
            7       2       do swap
        /      \  /    \
        9       6 3     1
        [4]
 */

func invertTree(_ root: TreeNode?) -> TreeNode? {
  guard root != nil else { return root }
  
  var queue = [root]
  
  while !queue.isEmpty {
    let node = queue.removeFirst()
    
    if node?.left == nil && node?.right == nil {
      continue
    }
    
    let temp = node?.left
    node?.left = node?.right
    node?.right = temp
    
    queue.append(node?.left)
    queue.append(node?.right)
  }
  
  return root
}
