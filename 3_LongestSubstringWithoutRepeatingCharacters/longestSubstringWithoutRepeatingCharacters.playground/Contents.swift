import UIKit

func lengthOfLongestSubstring(_ s: String) -> Int {
  guard s.count > 0 else { return 0 }
  let sArray = Array(s)
  var dictionary = [Character: Int]()
  var i = 0
  var j = 0
  var maxLength = 0
  while j < sArray.count {
    if let characterOccurance = dictionary[sArray[j]] {
      dictionary[sArray[j]] = characterOccurance + 1
      while dictionary[sArray[j]]! > 1 {
        if let existing = dictionary[sArray[i]] {
          dictionary[sArray[i]] = existing - 1
          i += 1
        }
      }
      
    } else {
      dictionary[sArray[j]] = 1
    }
    maxLength = max(maxLength, j-i+1)
    j += 1
  }
  return maxLength
}

print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))
print(lengthOfLongestSubstring("pwwkew"))

// This can be solved using a hashMap. maybe try that again which is more optimized way
func lengthOfLongestSubstringSet(_ s: String) -> Int {
  var set = Set<Character>()
  var maxLength = 0
  var start = 0
  
  for (end, char) in s.enumerated() {
    if set.contains(char) {
      while start < end && set.contains(char) {
        set.remove(s[s.index(s.startIndex, offsetBy: start)])
        start += 1
      }
      set.insert(char)
      maxLength = max(maxLength, end - start + 1)
    } else {
      set.insert(char)
      maxLength = max(maxLength, end - start + 1)
    }
  }
  
  return maxLength
}

print(lengthOfLongestSubstringSet("abcabcbb"))
print(lengthOfLongestSubstringSet("bbbbb"))
print(lengthOfLongestSubstringSet("pwwkew"))

