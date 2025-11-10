func removeStars(_ s: String) -> String {
  var stack = [Character]()
  
  for char in s {
    if char != "*" {
      stack.append(char)
    } else {
      stack.popLast()
    }
  }
  
  return String(stack)
}

print(removeStars("leet**cod*e"))
print(removeStars("erase*****"))
