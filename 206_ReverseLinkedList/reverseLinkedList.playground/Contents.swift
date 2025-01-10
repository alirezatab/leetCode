import UIKit

// Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
// doing itteratively by using stacks like recursively
// Time complexity : O(n).
// Assume that n is the list's length, the time complexity is O(n).

// Space complexity : O(n).
// The extra space comes from implicit stack space.
func reverseListIterativelyManualStack(_ head: ListNode?) -> ListNode? {
  var stack = [ListNode?]()
  var runner = head
  
  // push all nodes into Stacks
  while runner != nil {
    stack.append(runner)
    runner = runner!.next
  }
  
  var resultHead: ListNode?
  var current: ListNode?
  
  while !stack.isEmpty {
    if resultHead == nil {
      // Initialize the result head with the last node
      resultHead = stack.removeLast()
      current = resultHead
    } else {
      current?.next = stack.removeLast()
      current = current?.next
    }
  }
  
  // Terminate the reversed list
  current?.next = nil
  
  return resultHead
}

// same Time and Space as Above
func reverseListRecrusively(_ head: ListNode?) -> ListNode? {
  // base case is when head is nil from start... or when you get to the end
  // and .next is nil, meaning return the last node as head
  guard head != nil && head?.next != nil  else { return head }
  //if head == nil || head?.next == nil { return head }
  let reversedList = reverseList(head?.next)
  head?.next?.next = head
  head?.next = nil
  return reversedList
}

// Time: o(n)
// Time: o(1)
func reverseList(_ head: ListNode?) -> ListNode? {
  var prev: ListNode? = nil
  var current = head
  while current != nil {
    let tempNode = current?.next
    current?.next = prev
    prev = current
    current = tempNode
  }
  return prev
}
