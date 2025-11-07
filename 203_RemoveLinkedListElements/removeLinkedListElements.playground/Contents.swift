
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
func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
  guard head != nil else { return head }
  let sentinel = ListNode(0, head)
  var prev: ListNode? = sentinel
  var cur = head
  
  while cur != nil {
    if cur!.val == val {
      prev?.next = cur?.next
    } else {
      prev = cur
    }
    cur = cur?.next
  }
  
  return sentinel.next
}
