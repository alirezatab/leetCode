import Foundation

/* k == window
l
r
leetcode k = 3.. loop through the array, cur = 0, maxV = 0
                    if is a vowel, inc cur -> cur = 1
                    reduce k
                    max = max(max, cur)
l
 r
leetcode k = 2.. loop through the array, cur = 1

l
  r
leetcode k = 1.. loop through the array, cur = 2

l
   r
leetcode k = 0.. loop through the array, maxV = 2
                    do above
                    if k <= 0
                        if v@l is vowel,
                            subtract from curV
                        move l++
                        k ++
*/

// Time: o(n)
// Space: o(1)

func maxVowels(_ s: String, _ k: Int) -> Int {
  var cur = 0
  var maxV = 0
  var kCopy = k
  var leftPtr = 0
  var sArray = Array(s)
  
  for (rightPtr, ch) in sArray.enumerated() {
    if isVowel(ch) {
      cur += 1
    }
    kCopy -= 1
    maxV = max(maxV, cur)
    
    if kCopy <= 0 {
      if isVowel(sArray[leftPtr]) {
        cur -= 1
      }
      leftPtr += 1
      kCopy += 1
    }
  }
  return maxV
}

func isVowel(_ ch: Character) -> Bool {
  if ch == "a" || ch == "e" || ch == "i" || ch == "o" || ch == "u" {
    return true
  }
  return false
}

print(maxVowels("abciiidef", 3))
print(maxVowels("aeiou", 2))
print(maxVowels("leetcode", 3))


