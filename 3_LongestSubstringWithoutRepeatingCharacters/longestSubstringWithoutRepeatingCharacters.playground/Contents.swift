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

// O(n^2) cause
/*
In Swift, String uses Unicode-compliant indexing, which means:

Each s.index(s.startIndex, offsetBy: left) call walks through the string from the beginning
As left increases, this becomes increasingly expensive
Overall complexity becomes O(n²) in the worst case
*/
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

// O(n^2) cause
/*
In Swift, String uses Unicode-compliant indexing, which means:

Each s.index(s.startIndex, offsetBy: left) call walks through the string from the beginning
As left increases, this becomes increasingly expensive
Overall complexity becomes O(n²) in the worst case
*/
func lengthOfLongestSubstringSet3(_ s: String) -> Int {
    var left = 0
    var maxLength = 0
    var set = Set<Character>()

    for (right, character) in s.enumerated() {
        while left < right && set.contains(character) {
            set.remove(s[s.index(s.startIndex, offsetBy: left)])
            left += 1
        }

        set.insert(character)
        maxLength = max(maxLength, right - left + 1)
    }
    
    return maxLength
}

print(lengthOfLongestSubstringSet("abcabcbb"))
print(lengthOfLongestSubstringSet("bbbbb"))
print(lengthOfLongestSubstringSet("pwwkew"))

func lengthOfLongestSubstringSet2(_ s: String) -> Int {
    var left = 0
    var maxLength = 0
    var set = Set<Character>()
    let sArray = Array(s)

    for (right, character) in sArray.enumerated() {
        while left < right && set.contains(character) {
            set.remove(sArray[left])
            left += 1
        }

        set.insert(character)
        maxLength = max(maxLength, right - left + 1)
    }
    
    return maxLength
}

print(lengthOfLongestSubstringSet2("abcabcbb"))
print(lengthOfLongestSubstringSet2("bbbbb"))
print(lengthOfLongestSubstringSet2("pwwkew"))
