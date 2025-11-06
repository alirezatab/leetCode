
// Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
 /*
    go through the list and find the mid node
    you do this by using slow and fast pointer

     s
     f
    [1,2,2,1]
       s
         f
    [1,2,2,1]
         s
              f
    [1,2,2,1]


    slow is curent node
    when you have mid, you need to reverse the rest of the list
    // below code is for reversal
    var previous = nil
    let nextNode = curNode.next
    curNode.next = prev
    prev = curNode
    curNode = nextNode

    then you have a pointer ar prev which is the tail
    and start as head
    cheack value and get close to one another

     s
     f
    [1, 2]

        s
           f
    [1, 2]
     s   p
 */

// Time: o(n)
// space: o(1)
func isPalindrome(_ head: ListNode?) -> Bool {
  // code to get the mid of the linkedlist
  var slow = head
  var fast = head
  while fast != nil && fast?.next != nil {
    slow = slow?.next
    fast = fast?.next?.next
  }
  
  // code to reverse a list from a certain position
  var prev: ListNode?
  while slow != nil {
    let newNode = slow?.next
    slow?.next = prev
    prev = slow
    slow = newNode
  }
  
  var start = head
  while prev != nil {
    if prev?.val != start?.val {
      return false
    }
    prev = prev?.next
    start = start?.next
  }
  
  return true
}
