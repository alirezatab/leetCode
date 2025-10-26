
func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
  var mc = maxCost
  var maxLength = 0
  var left = 0
  var sArr = Array(s)
  var tArr = Array(t)
  
  for right in 0..<sArr.count {
    mc -= abs(Int(sArr[right].asciiValue!) - Int(tArr[right].asciiValue!))
    
    while mc < 0 {
      mc += abs(Int(sArr[left].asciiValue!) - Int(tArr[left].asciiValue!))
      left += 1
    }
    
    maxLength = max(maxLength, right - left + 1)
  }
  
  return maxLength
}

print(equalSubstring("abcd", "bcdf", 3))
print(equalSubstring("abcd", "cdef", 3))
print(equalSubstring("abcd", "acde", 0))
