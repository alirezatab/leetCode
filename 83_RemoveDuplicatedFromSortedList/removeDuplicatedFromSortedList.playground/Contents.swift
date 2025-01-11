import UIKit


//Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/*
     h
     s f
    [1,1,2,3,3,4,5]
         s f
    [1,2,3,3,4,5]

             s f
    [1,2,3,4,5]
*/

// Time: o(n)
// Space: o(1)
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
  var slow = head
  
  while slow != nil {
    if slow?.val == slow?.next?.val {
      slow?.next = slow?.next?.next
    } else {
      slow = slow?.next
    }
  }
  
  return head
}
