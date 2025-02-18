import UIKit


// Two Pointer
// time: o(N)
// Space: o(N - D)
func removeDuplicatesUsingTwoPointers(_ s: String, _ k: Int) -> String {
  guard s.count >= k else { return s }
  var freqStack = [Int]()
  var sArr = Array(s)
  var j = 0
  
  for i in 0..<sArr.count {
    sArr[j] = sArr[i]
    
    if j == 0 || sArr[j] != sArr[j - 1] {
      freqStack.append(1)
    } else {
      let freq = (freqStack.popLast() ?? 0) + 1
      if freq == k {
        j -= k
      } else {
        freqStack.append(freq)
      }
    }
    j += 1
  }
  
  return String(sArr[..<j])
}

print(removeDuplicatesUsingTwoPointers("abcd", 2)) // "abcd"
print(removeDuplicatesUsingTwoPointers("deeedbbcccbdaa", 3)) // "aa"
print(removeDuplicatesUsingTwoPointers("pbbcggttciiippooaais", 2)) // "ps"

// using Stack
// Time: o(n)
// Space: o(n)
func removeDuplicates(_ s: String, _ k: Int) -> String {
  guard s.count >= k else { return s }
  var charFreqStack = [(char: Character, freq: Int)]()
  
  for char in s {
    if let last = charFreqStack.last, last.char == char  {
      charFreqStack[charFreqStack.count - 1].freq += 1
      if charFreqStack.last!.freq == k {
        charFreqStack.removeLast()
      }
    } else {
      // charFreqStack is empty
      charFreqStack.append((char: char, freq: 1))
    }
  }
  
  /*
   var result = ""
   for entry in charFreqStack {
   result.append(String(repeating: entry.char, count: entry.freq))
   }
   */
  
  return charFreqStack.reduce("") { result, entry in
    result + String(repeating: entry.char, count: entry.freq)
  }
}

print(removeDuplicates("abcd", 2)) // "abcd"
print(removeDuplicates("deeedbbcccbdaa", 3)) // "aa"
print(removeDuplicates("pbbcggttciiippooaais", 2)) // "ps"

