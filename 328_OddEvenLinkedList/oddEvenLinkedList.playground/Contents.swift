
// Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 

// Time: o(n)
// Space: o(1)
// Technically, oddPointer != nil && oddPointer?.next != nil && does not do anything. checking even is enough
func oddEvenList(_ head: ListNode?) -> ListNode? {
  guard head != nil, head?.next != nil else { return head }
  var oddPointer = head
  var evenPointer = head?.next
  var firstEvenPointer = evenPointer
  
  // while oddPointer != nil && oddPointer?.next != nil &&
  //       evenPointer != nil && evenPointer?.next != nil {
  while oddPointer != nil && oddPointer?.next != nil &&
          evenPointer != nil && evenPointer?.next != nil {
    
    oddPointer?.next = oddPointer?.next?.next
    evenPointer?.next = evenPointer?.next?.next
    oddPointer = oddPointer?.next
    evenPointer = evenPointer?.next
  }
  
  oddPointer?.next = firstEvenPointer
  
  return head
}
