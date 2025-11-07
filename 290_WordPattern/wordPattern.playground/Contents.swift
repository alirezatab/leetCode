/*
 look through each character or word?
 *
 [abba]
 *
 [dog cat cat dog] if not in dictioanry, add it
 
 then for loop using zip and map
 if not the same, return false
 */


// Time: o(n)
/*
 Total: O(n + m)
 Note: Since the number of words is proportional to m, and n must equal word count, we can also say O(m) dominates if the string is long.
 */
// Space: o(n + m)
func wordPattern(_ pattern: String, _ s: String) -> Bool {
  var PatternArr = Array(pattern).map { String($0) }
  var sArr = s.split(separator: " ").map { String($0) }
  //var sArr = s.components(separatedBy: " ")
  guard PatternArr.count == sArr.count else { return false }
  var mapPS = [String: String]()
  var mapSP = [String: String]()
  
  for (pStr, sWord) in zip(PatternArr, sArr) {
    if mapPS[pStr] == nil && mapSP[sWord] == nil {
      mapPS[pStr] = sWord
      mapSP[sWord] = pStr
    } else if mapPS[pStr] != sWord || mapSP[sWord] != pStr {
      return false
    }
  }
  
  return true
}

print(wordPattern("abba", "dog cat cat dog"))
print(wordPattern("abba", "dog cat cat fish"))
print(wordPattern("aaaa", "dog cat cat dog"))
