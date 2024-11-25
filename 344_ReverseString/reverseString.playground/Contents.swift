import Foundation

func reverseString(_ s: inout [Character]) {
  
  var left = 0
  var right = s.count - 1
  
  while left < right {
    (s[left], s[right]) = (s[right], s[left])
    left += 1
    right -= 1
  }
}

print(["h","e","l","l","o"])
print(["H","a","n","n","a","h"])

