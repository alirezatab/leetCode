/*
 word1 = "cabbba", word2 = "abbccc"
 word1 = "cabbba" --> {a: 2, c: 1, b: 3}
 word2 = "abbccc" --> {a: 1, b: 2, c: 3}
 
 check to make sure all the keys on both dictionraies are the same... if not, it can no tbe permytation / close
 
 all values should be the same so put both in an arry
 sort both arrays
 
 if arrays are equal then return true, else return false
 */

// Time: o(n)
// Space: o(1) -> each hasmap takes o(26) at max.... each array will be 26 item as well. so o(1)

func closeStringsDictionary(_ word1: String, _ word2: String) -> Bool {
  guard word1.count == word2.count else { return false }
  var word1Freq = word1.reduce(into: [Character: Int]()) { counter, char in
    counter[char, default: 0] += 1
  }
  var word2Freq = word2.reduce(into: [Character: Int]()) { counter, char in
    counter[char, default: 0] += 1
  }
  
  if !(word1Freq.keys == word2Freq.keys) {
    return false
  }
  
  var sortedWord1Occurances = word1Freq.values.map { $0 }
  var sortedWord2Occurances = word2Freq.values.map { $0 }
  sortedWord1Occurances.sort()
  sortedWord2Occurances.sort()
  
  // var word1Set = Set<Int>()
  // var word2Set = Set<Int>()
  // for (key1Char, value) in word1Freq {
  //     guard word2Freq[key1Char] != nil else { return false }
  //     word1Set.insert(value)
  //     word2Set.insert(word2Freq[key1Char]!)
  // }
  
  return sortedWord1Occurances == sortedWord2Occurances
}

// Time: o(n)
// Space: o(1) -> each hasmap takes o(26) at max.... each array will be 26 item as well. so o(1)
func closeStrings(_ word1: String, _ word2: String) -> Bool {
  guard word1.count == word2.count else { return false }
  var word1Freq = [Int](repeating: 0, count: 26)
  var word2Freq = [Int](repeating: 0, count: 26)
  let aAsciiValue = Int(Character("a").asciiValue!)
  
  for (char1, char2) in zip(word1, word2) {
    var index = Int(char1.asciiValue!) - aAsciiValue
    word1Freq[index] += 1
    
    index = Int(char2.asciiValue!) - aAsciiValue
    word2Freq[index] += 1
  }
  
  for i in 0..<26 {
    // this is t make sure both strings have the same characters, same as below commented code
    /*
     if !(word1Freq.keys == word2Freq.keys) {
     return false
     }
     */
    if ((word1Freq[i] == 0 && word2Freq[i] > 0) ||
        (word2Freq[i] == 0 && word1Freq[i] > 0)) {
      return false
    }
  }
  
  word1Freq.sort()
  word2Freq.sort()
  
  return word1Freq == word2Freq
}
