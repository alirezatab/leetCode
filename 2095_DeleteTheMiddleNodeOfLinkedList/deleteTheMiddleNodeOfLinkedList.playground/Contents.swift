
// Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
 /*
first find the middle of the list
   p s
     f
    [1,3,4,7,1,2,6]

     p s
         f
    [1,3,4,7,1,2,6]

       p s
             f
    [1,3,4,7,1,2,6]

         p s
                 f
    [1,3,4,7,1,2,6] --> we break out of the loop cuase we found the middle and fast.next == nil

so I need to move a prevPointer with same speed as slow one.
 */

func deleteMiddle(_ head: ListNode?) -> ListNode? {
  guard head?.next != nil else { return nil }
  var prev: ListNode?
  var slow = head
  var fast = head
  
  while fast != nil && fast?.next != nil {
    prev = slow
    slow = slow?.next
    fast = fast?.next?.next
  }
  
  prev?.next = slow?.next
  
  return head
}

// by starting the fast at 2 position ahead oiginally, the slow will fall back into one behind the true middle. so that is the one that can be used to delete the next node with
func deleteMiddleNoNeedForPrev(_ head: ListNode?) -> ListNode? {
  guard head?.next != nil else { return nil }
  var slow = head
  var fast = head?.next?.next
  
  while fast != nil && fast?.next != nil {
    slow = slow?.next
    fast = fast?.next?.next
  }
  
  slow?.next = slow?.next?.next
  
  return head
}
