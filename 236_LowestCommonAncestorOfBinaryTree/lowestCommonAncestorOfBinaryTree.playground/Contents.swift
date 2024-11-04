import UIKit

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

 /*
root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
recrusive left, value, right
leftFlag = f, rightFlag = false, midFlag = false

guard root != nil else { return false }
dfs helper that has sapce properties as main funciton, just call root a node
left = dfs(node.left, p, q) ? 1 : 0
right = dfs(node.right, p, q) ? 1 : 0
mid = (node.val == p || node.val == q) ? 1 : 0

if (mid + left + right >= 2) {
    self.answer = node
}

return (mid + left + right > 0)

                    3.
                 t /     \
               t 5       1
             f / t\    /  \
              6    2  0    8
            f  f f/ \ t
                 7   4
                 f.  f
 */

// Big O - recursive
// Time: o(n)
// Space: o(n)
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    var answer: TreeNode?
    
    func dfs(_ node: TreeNode?,  _ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard node != nil else { return false }
        let left = dfs(node?.left, p, q) ? 1 : 0
        let right = dfs(node?.right, p, q) ? 1 : 0
        let mid = (node === p || node === q) ? 1 : 0

        if (left + right + mid) >= 2 {
            answer = node
        }

        return (left + right + mid) > 0
    }

    dfs(root, p, q)
    return answer
}

/*
    BFS Traversal
    visitedStack = { 3 }
    parent = { n3:Nil }

    while parent doesnt have p or q node
                    *       n = 3, vs = { 5, 1 }, p {3:Nil, 5:3, 1:3}
                    3           // anything lower than this line is probably not needed
                 /     \     n = 1, VS = {5}  p {3:Nil, 5:3, 1:3}
                5       1       n = 1, VS = {5, 0, 8}  p {3:Nil, 5:3, 1:3, 0:1, 8:1}
              /  \     /  \     n = 8 VS = {5, 0} p {3:Nil, 5:3, 1:3, 0:1, 8:1} -- pop
             6    2   0    8    n = 0 VS = {5} p {3:Nil, 5:3, 1:3, 0:1, 8:1} -- pop
                  / \           n = 5 VS = {} p {3:Nil, 5:3, 1:3, 0:1, 8:1}
                 7   4              n = 5 VS = {6, 2} p {3:Nil, 5:3, 1:3, 0:1, 8:1,
                                                        6:5, 2:5}
                                n = 2 VS = {6} p {3:Nil, 5:3, 1:3, 0:1, 8:1,
                                                 6:5, 2:5}
                                    n = 2 VS = {6, 7, 4} p {3:Nil, 5:3, 1:3, 0:1, 8:1,
                                                        6:5, 2:5, 7:2, 4:2}
                                since parent has both the p and the q as key, we break out of the loop.

        new set for Ancestors. --> aSet = {}
        add all p's ancestor to the new set using a while p != nil --> aSet = {5}, p = 3 which is the parent
        aSet = {5, 3}, p = nil --> so you break out of the loop

        while !ancesstors.contains(q) {
            q = parent.get(q)       q = 2, 5
        }

while parent doesnt have p or q node
    let node = VisitedStack.Pop(). --> vs = { }
    if node.left != nil
        add it to the visited Stack --> vs = { 5 }
        parent[node.left] = node

    if node.right != nil
        add it to the visited Stack --> vs = { 5,1 }
        parent[node.right] = node

    var create a
    while p != nil {
        ansestors.add(p)
        p = parent.get(p)
    }

    while (!ancestors.contains(q))
        q = parent.get(q);
    return q;
*/

// Big O - Iterativly
// Time: o(n)
// Space: o(n)
func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    var stack = [root]
    var parents: [Int?: TreeNode?] = [root?.val: nil]

    while !parents.keys.contains(p?.val) || !parents.keys.contains(q?.val) {
        let node = stack.removeLast()

        if node?.left != nil {
            stack.append(node?.left)
            parents[node?.left?.val] = node
        }

        if node?.right != nil {
             stack.append(node?.right)
             parents[node?.right?.val] = node
        }
    }

    var ancestors = Set<Int?>()
    var pNode = p
    var qNode = q
    while pNode != nil {
        ancestors.insert(pNode?.val)
        if let p = parents[pNode?.val] {
            pNode = p
        }
    }

    while !ancestors.contains(qNode?.val) {
        if let q = parents[qNode?.val] {
            qNode = q
        }
    }
    return qNode
}
