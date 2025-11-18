
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
// Note: last one is the best way that was completed and simplest to understand but no diagraming.

/*

            1.          [1]
        /       \
       2         3      [2,3]
         \        \
          5        4    [5, 4]
        /
       6                [6]

       traverse the tree in BFS, at each level, ad the nodes into a new array, the last element of the new array at that level is the one you see

create a queue --> for traversing
create a results = []
create nextLevels = [root].  [1]

while nextLevel is not empty
    create curLevels = nextLevels. cur = [1]
    nextLevel = []      next = []
    var resNode: TreeNode?

    while curLevels is not empty
        let node = dequeue curLevel. n = root, cl = [] , nl = []
        if left child exists
            nl.enquque(node.left)
        if rightchild exists
            nl.enque(node.right)
    
    }
    
    if let val = resNode {
        res.append(val)
    }
    return res
}
*/


class Solution {
    // Time: o(n) since one has to visit each node.
    // Space: o(W) to keep the queues, where W is a tree width. Let's use the last level to estimate the queue size. This level could contain up to N/2 tree nodes in the case of complete binary tree.
    func rightSideViewBFS(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [ ]}
        var curLevelsQueue = [TreeNode]()
        var res = [Int]()
        var nextLevelsQueue = [root!]

        while !nextLevelsQueue.isEmpty {
            curLevelsQueue = nextLevelsQueue
            nextLevelsQueue = []
            var resNode: TreeNode!

            while !curLevelsQueue.isEmpty {
                resNode = curLevelsQueue.removeFirst()
                if let leftChild = resNode.left {
                    nextLevelsQueue.append(leftChild)
                }
                if let rightChild = resNode.right {
                    nextLevelsQueue.append(rightChild)
                }
            }
            
            res.append(resNode.val)
        }
        return res
    }

    // Time: o(n)
    // Space: o(W)
    // using distance
    func rightSideViewComplicated(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [ ]}
        var queue = [root!]
        var res = [Int]()

        while !queue.isEmpty {
            let levelCount = queue.count

            for i in 0..<levelCount {
                let resNode = queue.removeFirst()
                if i == levelCount - 1 {
                    res.append(resNode.val)
                }
                if let leftChild = resNode.left {
                    queue.append(leftChild)
                }
                if let rightChild = resNode.right {
                    queue.append(rightChild)
                }
            }
        }
        return res
    }

/*

            1.          l = 0 res = [], add one into [1]
        /       \       go right first
       2         3      l = 1 res = [1], add one into [1, 3]
         \        \     go right first
          5        4    l = 2 res = [1,3], add one into [1, 3, 4]
        /               pop stack, go left, right
       6                l = 2 res = [1,3,4], level != count
                        go left
                        l = 3 res = [1,3,4], level == count --> [1,3,4,6]
    treverse the tree, from right first, then left at each traverse call, update to correct level
    before right and left,
    check for level to insert in res arry -> level = count of res array


    var res = []
    helper dfs(node, level) root, 0
        make sure node!= nil else return
        if level == res.count {
            res.append(node.val)
        }
        dfa(nodel.right, level + 1)
        dfs(node.left, level + )


    dfs(root, 0)
    return res

*/

    // Time: o(N)
    // Space: o(H) --> to keep the recursion stack, where H is a tree height. The worst-case situation is a skewed tree when H=N.
    func rightSideViewDFS(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        func dfsTraversal(_ node: TreeNode?, level: Int) {
            guard node != nil else { return }
            if level == res.count {
                res.append(node!.val)
            }

            dfsTraversal(node!.right, level: level + 1)
            dfsTraversal(node!.left, level: level + 1)
        }

        dfsTraversal(root, level: 0)
        return res
    }

    // quese BFS
    // Time: o(n)
    // Space:o(n)
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [ ] }
        var queue = [root]
        var res = [Int]()
        
        while !queue.isEmpty {
            let nodeInEachLevel = queue.count
            res.append((queue.last!)!.val)

            for i in 0..<nodeInEachLevel {
                let node = queue.removeFirst()
                if node?.left != nil {
                    queue.append(node?.left)
                }

                if node?.right != nil {
                    queue.append(node?.right)
                }
            }
        }

        return res
    }
}
