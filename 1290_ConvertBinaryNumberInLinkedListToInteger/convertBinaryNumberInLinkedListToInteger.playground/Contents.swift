
//  Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func getDecimalValueMine(_ head: ListNode?) -> Int {
  var listCount = -1
  var cur = head
  while cur != nil {
    listCount += 1
    cur = cur?.next
  }
  
  cur = head
  var sum = 0
  while cur != nil {
    if cur!.val == 1 {
      sum += Int(pow(2.0, Double(listCount)))
      //sum += 1 << listCount // --> this is also 2^listCount
    }
    listCount -= 1
    cur = cur?.next
  }
  
  return sum
}

//print(getDecimalValueMine([1,0,1]))
//print(getDecimalValueMine([0]))

/*
 Logic: Simulates building the binary number as you read it:
 result * 2 = shift left (make room for next bit)
 + cur!.val = append current bit
 */
func getDecimalValue(_ head: ListNode?) -> Int {
  var sum = 0
  var cur = head
  while cur != nil {
    sum = sum * 2 + cur!.val //
    cur = cur?.next
  }
  
  return sum
}


//print(getDecimalValue([1,0,1]))
//print(getDecimalValue([0]))
