/*
 "abbcd" -> { a: 1, b:2, c:1, d:1 }
 *
 order: "bcafg"  arr: [b,b], then remove b from coutner { a: 1, c:1, d:1 }
 *
 order: "bcafg"  arr: [b,b,c], then remove b from coutner { a: 1, d:1 }
 
 *
 order: "bcafg"  arr: [b,b,c,a], then remove a from coutner {d:1}
 
 *
 order: "bcafg"  arr: [b,b,c,a], then remove a from coutner {d:1 }
 
 if counter is not empty, loop hrough it and append it to the result, based on the freq also
 return result array as string
 
 
 var result arr = []
 create freqCount for s.
 loop through order, get the char
 see if char exists in the dictionray
 arr.append(char, count: value)
 remove b from counter
 */

// Time: o(n + m), order being m and bounded by 26 so we can say o(n)
// Space: o(n)

func customSortString(_ order: String, _ s: String) -> String {
  var sFreqCounter = s.reduce(into: [Character: Int]()) { counter, char in
    counter[char, default: 0] += 1
  }
  
  var result = [String]()
  
  for char in order {
    if let sOccurance = sFreqCounter[char] {
      result += [String](repeating: "\(char)", count: sOccurance)
      sFreqCounter[char] = nil
    }
  }
  
  for (char, sOccurance) in sFreqCounter {
    result += [String](repeating: "\(char)", count: sOccurance)
  }
  
  //return result.joined(separator: "")
  return result.joined()
}

print(customSortString("cba", "abcd"))
print(customSortString("bcafg", "abcd"))
