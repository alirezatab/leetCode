
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
DFS......
            1
        /       \
        2       2
      /  \     / \
    3     4   4   3

    left child aginst the right
    right againtst the left

    if root == nil { return true }
    dfs (left, right) {

    }

    dfs(leftChild, rightChild)
        if left is nil and right is nil, return true
        if left is nill or right is nil return false
        if left.val != right.val { retrun false }
        dfs(left.leftCHild, right.rightChild) && dfs(left.right, right.left)

    dfs(left, right)
*/
// Time: o(n) we visit at worst each node once
// Space: o(n) stack call will have at max o(n), when the tree is perfectly symmetric
class Solution {
    func isSymmetricDFSTry2(_ root: TreeNode?) -> Bool {
        
        func dfs(_ leftNode: TreeNode?, _ rightNode: TreeNode?) -> Bool {
            if leftNode == nil && rightNode == nil { return true }
            if leftNode == nil || rightNode == nil { return false }

            return leftNode?.val == rightNode?.val &&
                    dfs(leftNode?.left, rightNode?.right) &&
                    dfs(leftNode?.right, rightNode?.left)
        }

        return dfs(root?.left, root?.right)
    }

    func isSymmetricDFSTry1(_ root: TreeNode?) -> Bool {
        
        func dfs(_ leftNode: TreeNode?, _ rightNode: TreeNode?) -> Bool {
            if leftNode == nil && rightNode == nil { return true }
            if leftNode == nil || rightNode == nil { return false }
            if leftNode?.val != rightNode?.val { return false}

            return dfs(leftNode?.left, rightNode?.right) &&
                    dfs(leftNode?.right, rightNode?.left)
        }

        return dfs(root?.left, root?.right)
    }
/*
            1
        /       \
        2       2
      /  \     / \
    3     4   4   3


BFS......
[1,1] -> left = 1, right = 1
while queue.isNotEmptu
    queue.count == 2
    leftNode = remove
    rigthNode = remove
    left.val != rigth.Val { return false }
    for queue.count
        queue.push -> [left.left, right.right, left.right, right.left]

    [2,2,2,2] -> deque [2,2] -> [2,2] ->  [2,2,3,3,4,4]
    [2,2,3,3,4,4] -> deque [2,2] -> [3,3,4,4] -> [3,3,4,4,3,3,4,4]
    [3,3,4,4,3,3,4,4] -> deque [3,3] -> [4,4,3,3,4,4] -> [4,4,3,3,4,4, nil, nil]
    [4,4,3,3,4,4, nil, nil] -> deque [4,4] -> [3,3,4,4, nil, nil] -> [3,3,4,4, nil, nil, nil, nil]
    [3,3,4,4, nil, nil, nil, nil] -> deque [3,3] -> [4,4, nil, nil, nil, nil] -> [4,4, nil, nil, nil, nil, nil, nil]
    [4,4, nil, nil, nil, nil, nil, nil] -> deque [4,4] -> [nil, nil, nil, nil, nil, nil] -> [nil, nil, nil, nil, nil, nil, nil, nil]
*/

// Time: o(n) we visit at worst each node twice
// Space: o(n) queue will visit every node twice so at works, it will have 2n which is same as o(n)
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        var queue = [root, root]

        while !queue.isEmpty {
            let leftNode = queue.removeFirst()
            let rightNode = queue.removeFirst()
            if leftNode == nil && rightNode == nil {
                continue
            }
            if leftNode == nil && rightNode != nil {
                return false
            }
            if leftNode != nil && rightNode == nil {
                return false
            }
            if leftNode?.val != rightNode?.val {
                return false
            }


            queue.append(leftNode?.left)
            queue.append(rightNode?.right)
            queue.append(leftNode?.right)
            queue.append(rightNode?.left)

        }
        return true
    }
}
