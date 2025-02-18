import UIKit

// using stack
// time: o(N), where N is a string length.
// space: o(N - D)  where D is a total length for all duplicates.
func removeDuplicatesUsingStack(_ s: String) -> String {
  var stack = [Character]()
  for char in s {
    if let lastChar = stack.last, lastChar == char {
      stack.removeLast()
    } else {
      stack.append(char)
    }
  }
  
  return String(stack)
}

print(removeDuplicatesUsingStack("abbaca")) // "ca"
print(removeDuplicatesUsingStack("abbaca")) // "ca"


// using two pointers
// Time: o(n) - since we have to go throught the array once.
// space: o(1)
func removeDuplicates(_ s: String) -> String {
  guard s.count > 1 else { return s}
  var sArr = Array(s)
  
  var j = 1
  for i in 1..<sArr.count {
    sArr[j] = sArr[i]
    if j != 0 && sArr[j] == sArr[j - 1] {
      j -= 2
    }
    j += 1
  }
  
  return String(sArr[..<j])
}

print(removeDuplicates("abbaca")) // "ca"
print(removeDuplicates("azxxzy")) // "ay"
