
// Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
  guard left != right, head != nil else { return head }
  
  var head = head
  var previous: ListNode?
  var prevStart: ListNode?
  var newReversedEnd: ListNode?
  var cur = head
  
  for _ in 1..<left {
    previous = cur
    cur = cur?.next
  }
  
  prevStart = previous // connector
  newReversedEnd = cur // tail
  
  for _ in left...right {
    // reverse it
    let nextNode = cur?.next
    cur?.next = previous
    previous = cur
    cur = nextNode
  }
  
  //prevStart?.next = previous
  newReversedEnd?.next = cur
  
  if prevStart == nil {
    head = previous
  } else {
    prevStart?.next = previous
  }
  
  return head
}

func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
  guard head != nil else { return nil }
  
  var head = head
  var cur = head
  var prev: ListNode?
  var counter = 1
  
  while counter < left {
    prev = cur
    cur = cur?.next
    counter += 1
  }
  
  var connector = prev
  var tail = cur
  
  while counter <= right {
    let newNode = cur?.next
    cur?.next = prev
    prev = cur
    cur = newNode
    counter += 1
  }
  
  if connector != nil {
    connector?.next = prev
  } else { // if we reverse from first element, then con will point to original prev whiich was nil, so out head will be prev at the end.
    head = prev
  }
  
  tail?.next = cur
  
  return head
}
