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
