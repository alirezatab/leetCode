
func reverseOnlyLetters(_ s: String) -> String {
  var arr = Array(s)
  var left = 0
  var right = arr.count - 1
  
  while left < right {
    if arr[left].isLetter && arr[right].isLetter {
      (arr[left], arr[right]) = (arr[right], arr[left])
      left += 1
      right -= 1
    }
    
    if !arr[left].isLetter {
      left += 1
    }
    
    if !arr[right].isLetter {
      right -= 1
    }
  }
  
  return String(arr)
}

print(reverseOnlyLetters("ab-cd"))
print(reverseOnlyLetters("a-bC-dEf-ghIj"))
print(reverseOnlyLetters("Test1ng-Leet=code-Q!"))
