
func makeGood(_ s: String) -> String {
  var stack = [Character]()
  for char in s {
    if let lastChar = stack.last, lastChar != char && lastChar.lowercased() == char.lowercased() {
      stack.popLast()
      // stack.removeLast() is a lot slower
      continue
    }
    stack.append(char)
  }
  
  return String(stack)
}

print(makeGood("leEeetcode"))
print(makeGood("abBAcC"))
print(makeGood("s"))
