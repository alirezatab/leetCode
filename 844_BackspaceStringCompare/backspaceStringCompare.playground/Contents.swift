
func backspaceCompare(_ s: String, _ t: String) -> Bool {
  var sStack = [Character]()
  var tStack = [Character]()
  
  for char in s {
    if char != "#" {
      sStack.append(char)
    } else if !sStack.isEmpty {
      sStack.removeLast()
    }
  }
  
  
  for char in t {
    if char != "#" {
      tStack.append(char)
    } else if !tStack.isEmpty {
      tStack.removeLast()
    }
  }
  
  return sStack == tStack
}

print(backspaceCompare("ab#c", "ad#c"))
print(backspaceCompare("ab##", "c#d#"))
print(backspaceCompare("a#c", "b"))
