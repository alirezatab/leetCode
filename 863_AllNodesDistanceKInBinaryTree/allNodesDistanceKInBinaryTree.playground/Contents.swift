
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
    dfs... connect everynode to their parent to make this a graph
    how to make a grah --> Dic{node: [neihgbor nodes]}
    so maube in my dfs function pass node and the parent


    {3: [5,1], 5:[2,6,3], 6:[5], 2: [5,7,4], 1: [3,0,8], 0:[1], 8:[0]}
    dic [Node: [Node]]

    dfs(node, parentNode)
        id the node == nil return
        dict[nide.val].append(node.left)
        dict[nide.val].append(node.right)
        if parentNode != nill then add dict[nide.val].append(parentNode)
        dfs(node.left, node)
        dfs(node.right, node)

    --> orgiinaly 5 , n = 1
    --> after first loop [2,6,3], remaining = 1 , n = 3
    --> remaing = 0, 5 already in seen so we process 7 and 4, then we go ro 3, 3 has 1 -> [7,4, 1]

    return [7,4, 1]

    add 5 to the queue
    var seen = {5}
    while remainng > 0 {
        let n = queue.count
        deque
        remaining -= 1
        for i in 0..<n { [2,6,3]
            if not in seen
                add them to the queue
                add them to seen
        }

    }
    
    look into dictioanry and get the target node
        then do bfs frm target node

        for neighbor in neigbirs {

        }
*/

func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
  guard root != nil else {return [ ]}
  var remaining = k
  
  var graph = [Int: [Int]]()
  func dfs(_ node: TreeNode?, _ parent: TreeNode?) {
    guard node != nil else { return }
    if node!.left != nil {
      graph[node!.val, default: [ ]].append(node!.left!.val)
    }
    if node!.right != nil {
      graph[node!.val, default: [ ]].append(node!.right!.val)
    }
    
    if parent != nil {
      graph[node!.val, default: [ ]].append(parent!.val)
    }
    
    dfs(node?.left, node)
    dfs(node?.right, node)
  }
  dfs(root, nil)
  
  var queue = [target!.val]
  var seen: Set<Int> = [target!.val]
  
  while remaining > 0 {
    let level = queue.count
    remaining -= 1
    
    for i in 0..<level {
      let nodeVal = queue.removeFirst()
      
      for neighborVal in graph[nodeVal, default: [ ]] {
        if !seen.contains(neighborVal) {
          queue.append(neighborVal)
          seen.insert(neighborVal)
          print(queue)
        }
      }
    }
  }
  
  return queue
}
