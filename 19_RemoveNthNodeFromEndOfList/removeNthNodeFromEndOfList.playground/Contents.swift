
// Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/*
 s   f
 [1,2,3,4,5], n = 2  first for loop
 
 s   f
 [1,2,3,4,5], n = 2 while fast != nil, move both one node at a time
 
 s   f
 [1,2,3,4,5], n = 2 while fast != nil, move both one node at a time
 */

// Time: o(n)
// Space: o(1)
// this is making one extra gap, so the gap is n+1 so that prev pointer is not needed
func removeNthFromEndNoPrev(_ head: ListNode?, _ n: Int) -> ListNode? {
  var dummy: ListNode? = ListNode(0)
  dummy?.next = head
  
  
  var first = dummy
  var second = dummy
  
  // becuase we are not using prev, we do n+1
  for i in 1...n+1 {
    first = first?.next
  }
  
  while first != nil {
    first = first?.next
    second = second?.next
  }
  
  
  second?.next = second?.next?.next
  
  return dummy?.next
}

// Time: o(n)
// Space: o(1)
func removeNthFromEndWithDummy(_ head: ListNode?, _ n: Int) -> ListNode? {
  var dummy: ListNode? = ListNode(0)
  dummy?.next = head
  
  var prev: ListNode?
  var first = dummy
  var second = dummy
  
  // becuase we are not starting at the head so we do n+1, or we can say 0...n
  for i in 1...n {
    first = first?.next
  }
  
  while first != nil {
    prev = second
    first = first?.next
    second = second?.next
  }
  
  
  prev?.next = second?.next
  //second?.next = second?.next?.next
  
  return dummy?.next
}

// Time: o(n)
// Space: o(1)
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
  var prev: ListNode?
  var first = head
  var second = head
  
  // becuase we are not starting at the head so we do n+1, or we can say 0...n
  for i in 1...n {
    first = first?.next
  }
  
  // if first already went to nil, means that head is the one to be deleted, so we return head.next
  if first == nil {
    return head?.next
  }
  
  while first != nil {
    prev = second
    first = first?.next
    second = second?.next
  }
  
  prev?.next = second?.next
  //second?.next = second?.next?.next
  
  return head
}
