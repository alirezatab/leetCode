import UIKit


// Time Complexity: O(J.length+S.length). The O(J.length) part comes from creating J. The O(S.length) part comes from searching S.

// Space Complexity: O(J.length).
func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
  var jewelsSet = Set<Character>()
  for char in jewels {
    jewelsSet.insert(char)
  }
  
  var result = 0
  for char in stones {
    if jewelsSet.contains(char) {
      result += 1
    }
  }
  
  return result
}

print(numJewelsInStones("aA", "aAAbbbb"))
print(numJewelsInStones("aAb", "aAAbbbb"))
print(numJewelsInStones("z", "ZZ"))

