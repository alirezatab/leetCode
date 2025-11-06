/*
 *            *
 "paper", t = "title"
 
 */

// Time: o(n)
// space: o(k) and k is asccii char so can be o(1)
/*
 Time Complexity:
 Two full passes over the strings → O(n + n) = O(n).
 
 Space Complexity:
 Uses one dictionary at a time (cleared in between) → O(k), where k is the number of unique characters (≤ 256 for ASCII).
 */
func isIsomorphicTwoPassesForDictioanry(_ s: String, _ t: String) -> Bool {
  guard s.count == t.count else {return false}
  var mapper = [Character: Character]()
  var sArr = Array(s)
  var tArr = Array(t)
  
  for (i, char) in s.enumerated() {
    if let val = mapper[char], val != tArr[i] {
      return false
    } else {
      mapper[char] = tArr[i]
    }
  }
  
  mapper.removeAll()
  for (i, char) in t.enumerated() {
    if let val = mapper[char], val != sArr[i] {
      return false
    } else {
      mapper[char] = sArr[i]
    }
  }
  
  return true
}

// one pass for dictionary but same time ans space
// Time: o(n)
// space: o(k) and k is asccii char so can be o(1)
func isIsomorphicOnePassDictionary(_ s: String, _ t: String) -> Bool {
  guard s.count == t.count else {return false}
  var mapST = [Character: Character]()
  var mapTS = [Character: Character]()
  
  var sArr = Array(s)
  var tArr = Array(t)
  
  for (charS, charT) in zip(sArr, tArr) {
    if mapST[charS] == nil && mapTS[charT] == nil {
      mapST[charS] = charT
      mapTS[charT] = charS
    } else if mapST[charS] != charT || mapTS[charT] != charS {
      return false
    }
  }
  
  return true
}

// Time: o(n)
// Space: o(n)
// Transforms a string based on first occurrence index of each character
func transformString(_ s: String) -> String {
  var indexMapping: [Character: Int] = [:]
  var newStr: [String] = []
  let chars = Array(s)
  
  for (i, c) in chars.enumerated() {
    if indexMapping[c] == nil {
      indexMapping[c] = i
    }
    newStr.append(String(indexMapping[c]!))
  }
  
  return newStr.joined(separator: " ")
}

// Compares the transformed forms of s and t
func isIsomorphic(_ s: String, _ t: String) -> Bool {
  return transformString(s) == transformString(t)
}

// Time: o(n x k) and at worse o(n^2)
// Space: o(k)
/*
 Time Complexity:
 - The dic.values.contains(tChar) call is O(k) per iteration (since it scans all values).
 - Total: O(n × k) → worst-case O(n²) if many unique chars (e.g., all distinct).
 
 Space Complexity:
 - One dictionary → O(k).
 */
func isIsomorphicNotOptimized2(_ s: String, _ t: String) -> Bool {
  guard s.count == t.count else {return false}
  
  var dic = [Character:Character]()
  
  let sArray = Array(s)
  let tArray = Array(t)
  
  for i in 0..<s.count {
    let sChar = sArray[i]
    let tChar = tArray[i]
    if let val = dic[sChar] {
      if val == tChar {
        continue
      } else {
        return false
      }
    } else {
      if dic.values.contains(tChar) {
        return false
      } else {
        dic[sChar] = tChar
      }
    }
    
  }
  
  return true
}

func isIsomorphicStringSlow(_ s: String, _ t: String) -> Bool {
  var mapper = [Character: Character]()
  for (i, char) in s.enumerated() {
    let charTatIndex = t[t.index(t.startIndex, offsetBy: i)]
    if let val = mapper[char], val != charTatIndex {
      return false
    } else {
      mapper[char] = charTatIndex
    }
  }
  
  mapper.removeAll()
  for (i, char) in t.enumerated() {
    let charSatIndex = s[s.index(s.startIndex, offsetBy: i)]
    if let val = mapper[char], val != charSatIndex {
      return false
    } else {
      mapper[char] = charSatIndex
    }
  }
  
  return true
}
