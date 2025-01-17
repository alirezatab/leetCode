import UIKit


// Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// start from middle and find the middle
// use slow pointer, prev and next to reverse the second half of the LL.
// from start and end, start adding and keep track of max
// return max

// Time: o(n)
// space: o(1)
func pairSum(_ head: ListNode?) -> Int {
  var slow = head
  var fast = head
  
  // find the middle of the LinkedList
  while fast != nil && fast?.next != nil {
    slow = slow?.next
    fast = fast?.next
  }
  
  var prev: ListNode?
  // start reverse the upper half
  while slow != nil {
    var nextNode = slow?.next // we save the address that pointer point to
    slow?.next = prev // this is the pointer
    prev = slow
    slow = nextNode
  }
  
  // start adding from start and end
  var start = head
  var end = prev
  var maxSum = 0
  while end != nil {
    let sum = start!.val + end!.val
    maxSum = max(maxSum, sum)
    start = start?.next
    end = end?.next
  }
  
  return maxSum
}
