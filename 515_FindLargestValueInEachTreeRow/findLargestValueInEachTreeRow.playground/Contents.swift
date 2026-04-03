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
 
// Time: o(n)
// Space: o(n)
func largestValues(_ root: TreeNode?) -> [Int] {
    guard root != nil else { return [ ] }
    var queue = [root]
    var res = [Int]()
    
    while !queue.isEmpty {
        let count = queue.count
        var curMax = Int.min
        var nextQueue = [TreeNode?]()
        
        for i in 0..<count {
            let node = queue[i]
            curMax = max(curMax, node!.val)
            if node?.left != nil {
                nextQueue.append(node?.left)
            }
            
            if node?.right != nil {
                nextQueue.append(node?.right)
            }
        }
        
        queue = nextQueue
        res.append(curMax)
    }
    
    return res
}
