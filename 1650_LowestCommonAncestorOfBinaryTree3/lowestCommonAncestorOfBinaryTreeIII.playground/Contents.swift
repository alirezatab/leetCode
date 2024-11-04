import Foundation
public class Node {
     public var val: Int
     public var left: Node?
     public var right: Node?
     public var parent: Node?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
         self.parent = nil
    }
}

/*
 wanted to pose an easy-to-understand alternative to most answers here. We first find the depth of each pointer, and then move each pointer to the same level in the tree. Then, we move the pointers up level by level until they meet.

Summary:

Find the depth of each pointer
Move the deeper pointer up until it is at the same level as the other pointer
Move each pointer up level-by-level until they meet
Time Complexity: O(h)
Space Complexity: O(1)

Example 1:
                3           pDepth = 2
              /   \         qDepth = 3
           p 5       1
            / \     /   \
           6   2   0     8 q
              / \
             7   4

so we move q up till qdDepth is 2
                3           pDepth = 2
              /   \         qDepth = 2
           p 5       1 q
            / \     /   \
           6   2   0     8
              / \
             7   4

now if p and q are not the same, move both till they meet and return pp or q
                3 p q
              /   \
             5       1
            / \     /   \
           6   2   0     8
              / \
             7   4


Example 2:
                3           pDepth = 2
              /   \         qDepth = 4
           p 5       1
            / \     /   \
           6   2   0     8
              / \
             7   4 q

so we move q up till qdDepth is 2
                3           pDepth = 2
              /   \         qDepth = 3
           p 5       1
            / \     /   \
           6   2q  0     8
              / \
             7   4

                3           pDepth = 2
              /   \         qDepth = 32
           p 5 q   1
            / \     /   \
           6   2   0     8
              / \
             7   4

now if p and q are not the same, move both till they meet and return pp or q
if they are the same, then just reutrn p or q

func getDepth(node: Node?) -> Int {
    var depth = 0
    var n = node
    while n != nil {
        n = n?.parent
        depth += 1
    }
    return depth
}

func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
    var p = p
    var q = q
    var pDepth = getDepth(node: p)
    var qDepth = getDepth(node: q)

    while pDepth > qDepth {
        p = p?.parent
        pDepth -= 1
    }

    while qDepth > pDepth {
        q = q?.parent
        qDepth -= 1
    }

    while p?.val != q?.val {
        p = p?.parent
        q = q?.parent
    }

    return p
}
*/


/*
                3
              /   \
           p 5       1 q
            / \     /   \
           6   2   0     8
              / \
             7   4

set pAncestor = { 5, 3 } // add Nodes
check qAncestor, if qAncestor in pAnscestor set, return that Node


                3
              /   \
           p 5       1
            / \     /   \
           6   2   0     8
              / \
             7   4 q

set pAncestor = { 5, 3 } // add Nodes
check qAncestor,  --> is 4 in pAncestor --> No
    parent = q.parent

check qAncestor,  --> is 2 in pAncestor --> No
    parent = q.parent

check qAncestor,  --> is 5 in pAncestor --> Yo
    return Node

var pAncestor: Set<Node>
var p = p
add p to pAncestor

while p != nil {
    let p = p.parent
    add p to pAncestor
}

var q = q
while q != nil {
    q = q.parent
    if q.val is in pAncestor { return q }
}
reurn nil

                1 q
              /   \
           p 2
*/

/*
-- Time complexity:
- The time complexity is O(h), where hhh is the height of the tree. This is because we are traversing from each node to the root, which takes linear time relative to the height of the tree.

-- Space complexity:
- The space complexity is O(h) as well, since in the worst case, we need to store all ancestors of a node, which would be proportional to the height of the tree.
*/
  
func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
    var p = p
    var q = q
    var pAncestors = Set<Int?>()
    
    while p != nil {
        pAncestors.insert(p?.val)
        p = p?.parent
    }
    
    while q != nil {
        if pAncestors.contains(q?.val) { return q }
        q = q?.parent
    }
    
    return nil
}
    
