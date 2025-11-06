
//  Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
// Time: o(n)
// Space: o(n)
func swapNodesMyWay(_ head: ListNode?, _ k: Int) -> ListNode? {
  
  let sentinel = ListNode(0, head)
  var leftPtr: ListNode? = sentinel
  var rightPtr: ListNode? = sentinel
  
  for i in 1...k {
    leftPtr = leftPtr?.next
  }
  
  var fast = leftPtr
  while fast != nil {
    rightPtr = rightPtr?.next
    fast = fast?.next
  }
  
  // let tempVal = leftPtr!.val
  // leftPtr!.val = rightPtr!.val
  // rightPtr!.val = tempVal
  (leftPtr!.val, rightPtr!.val) = (rightPtr!.val, leftPtr!.val)
  
  return sentinel.next
}

func swapNodesMyWayWithEditorialVariableNames(_ head: ListNode?, _ k: Int) -> ListNode? {
  
  var frontNode = head
  //var leftPtr: ListNode? = sentinel
  var endNode = head
  //var rightPtr: ListNode? = sentinel
  
  for i in 1..<k {
    frontNode = frontNode?.next
  }
  
  var fast = frontNode
  while fast?.next != nil {
    endNode = endNode?.next
    fast = fast?.next
  }
  
  // let tempVal = leftPtr!.val
  // leftPtr!.val = rightPtr!.val
  // rightPtr!.val = tempVal
  (frontNode!.val, endNode!.val) = (endNode!.val, frontNode!.val)
  
  return head
}

func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
  var listCount = 0
  var frontNode: ListNode?
  var endNode: ListNode?
  var curNode = head
  
  while curNode != nil {
    listCount += 1
    
    if endNode != nil {
      endNode = endNode?.next
    }
    
    if listCount == k {
      frontNode = curNode
      endNode = head
    }
    curNode = curNode?.next
  }
  
  (frontNode!.val, endNode!.val) = (endNode!.val, frontNode!.val)
  
  return head
}
