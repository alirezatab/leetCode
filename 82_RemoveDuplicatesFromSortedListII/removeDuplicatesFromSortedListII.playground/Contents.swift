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
    var previous = nil

  p s f
   [1,2,3,3,4,4,5], check value of s and f, 1 != 2, so increment both
    p s f
   [1,2,3,3,4,4,5], check value of s and f, 2 != 3, so increment both
      p s f
   [1,2,3,3,4,4,5], check value of s and f, 3 == 3, then prev.next = fast.next
                    slow = fast.next || slow = prev.next
                    fast = fast.next.next || fast = prev.next.next

      p     s f
   [1,2,3,3,4,4,5], check value of s and f, 3 == 3, then prev.next = fast.next
                    slow = fast.next || slow = prev.next
                    fast = fast.next.next || fast = prev.next.next



*/

// Time: o(n)
// space: o(1)
func deleteDuplicatesTwoPointer(_ head: ListNode?) -> ListNode? {
  guard head != nil, head?.next != nil else { return head }
  
  var dummy: ListNode? = ListNode(-1)
  dummy?.next = head
  var prev = dummy
  var slow = head
  var fast = head?.next
  
  while fast != nil {
    if slow?.val != fast?.val {
      prev = slow
      slow = slow?.next
      fast = fast?.next
    } else {
      while slow?.val == fast?.val {
        fast = fast?.next
      }
      prev?.next = fast
      slow = fast
      fast = fast?.next
    }
  }
  
  return dummy?.next
}

func deleteDuplicatesEditorialWay(_ head: ListNode?) -> ListNode? {
  // Sentinel node pointing to the head
  let sentinel = ListNode(0, head)
  var pred: ListNode? = sentinel
  var current = head
  
  while current != nil {
    // If it's the start of a duplicate sequence
    if current?.next != nil && current?.val == current?.next?.val {
      // Move to the end of duplicates
      while current?.next != nil && current?.val == current?.next?.val {
        current = current?.next
      }
      // Skip all duplicates
      pred?.next = current?.next
    } else {
      // No duplicates, move pred forward
      pred = pred?.next
    }
    // Move current forward
    current = current?.next
  }
  
  return sentinel.next
}
