/*
edge case: if s1.ounct > s2.count, return flase
    need a Dictioanry of s1 --> {a: 1, b: 1}
    var start = 0

    we go through s2 from begnining and check the window size that is == to s1.count
     se
    "eidbaooo"
    do a freq count of that window, if keys do match, return true false






    for start in 0..<s2.count - s1.count {

        for end in start...start + s1.count {
            do a freqCount of that windown

            if keys match return true
        }

        return flase

    }

*/

// Time: o(m x n)
// Space: o(n) cause of the array for simple access.. otherwise it can be o(1)
/*
Building s1Freq:

Iterates over s1 once → O(m)
Main loop:

Runs (n - m + 1) times → O(n - m + 1) ≈ O(n) iterations (when m << n)
Inside each iteration:

Builds s2Freq by scanning m characters → O(m)
Calls isMatch, which iterates over at most m unique characters in s1Freq → O(m) (or O(1) if alphabet is fixed)
So each iteration is O(m)

Total time:
O(m) + O(n × m) = O(n × m)
*/

// Space: o(n) cause of the array used otherwise o(1)

func checkInclusionHasMap(_ s1: String, _ s2: String) -> Bool {
  guard s1.count <= s2.count else { return false }
  
  var s2Arr = Array(s2)
  var s1Freq = s1.reduce(into: [Character: Int]()) {counter, char in
    counter[char, default: 0] += 1
  }
  var s2Freq = [Character: Int]()
  
  for start in 0...s2.count - s1.count {
    s2Freq = [Character: Int]()
    
    for end in start..<start + s1.count {
      s2Freq[s2Arr[end], default: 0] += 1
    }
    
    // for end in 0..<s1.count {
    //     s2Freq[s2Arr[start + end], default: 0] += 1
    // }
    
    if isMatch(s1Freq, s2Freq) {
      return true
    }
  }
  return false
}

// Time: o(m x n)
// Space: o(1)
func checkInclusionArrayNoSliding(_ s1: String, _ s2: String) -> Bool {
  guard s1.count <= s2.count else { return false }
  
  var s2Arr = Array(s2)
  let aAscii = Int(Character("a").asciiValue!)
  var s1FreqArr = [Int](repeating: 0, count: 26)
  var s2FreqArr = [Int](repeating: 0, count: 26)
  
  for char in s1 {
    s1FreqArr[Int(char.asciiValue!) - aAscii] += 1
  }
  
  
  for start in 0...s2.count - s1.count {
    s2FreqArr = [Int](repeating: 0, count: 26)
    
    for end in start..<start + s1.count {
      let index = Int(s2Arr[end].asciiValue!) - aAscii
      s2FreqArr[index] += 1
    }
    
    // for end in 0..<s1.count {
    //     s2FreqArr[s2Arr[start + end]] += 1
    // }
    
    if isMatch(s1FreqArr, s2FreqArr) {
      return true
    }
  }
  return false
}

// Time: o(n) and n is size of s2
// space: o(1) if you dont count the S1Arr and S2 array otherwise is o(m + n)
func checkInclusion(_ s1: String, _ s2: String) -> Bool {
  guard s1.count <= s2.count else { return false }
  
  var s1Arr = Array(s1)
  var s2Arr = Array(s2)
  
  let aAscii = Int(Character("a").asciiValue!)
  var s1FreqArr = [Int](repeating: 0, count: 26)
  var s2FreqArr = [Int](repeating: 0, count: 26)
  
  for i in 0..<s1.count {
    s1FreqArr[Int(s1Arr[i].asciiValue!) - aAscii] += 1
    s2FreqArr[Int(s2Arr[i].asciiValue!) - aAscii] += 1
  }
  
  print(s1FreqArr)
  print(s2FreqArr)
  
  for start in 0..<s2.count - s1.count {
    if isMatch(s1FreqArr, s2FreqArr) {
      return true
    }
    var index = Int(s2Arr[start + s1.count].asciiValue!) - aAscii
    s2FreqArr[index] += 1
    index = Int(s2Arr[start].asciiValue!) - aAscii
    s2FreqArr[index] -= 1
  }
  
  return isMatch(s1FreqArr, s2FreqArr)
}

private func isMatch(_ s1Freq: [Int], _ s2Freq: [Int]) -> Bool {
  for i in 0..<26 {
    if s1Freq[i] != s2Freq[i] {
      return false
    }
  }
  return true
}

// Does not finish cause strin access seems expensive
func checkInclusionNotOptimzed(_ s1: String, _ s2: String) -> Bool {
  guard s1.count <= s2.count else { return false }
  
  let s1Count = s1.count
  let s2Count = s2.count
  let s2StartIndex = s2.startIndex
  
  var s1Freq = s1.reduce(into: [Character: Int]()) { counter, char in
    counter[char, default: 0] += 1
  }
  
  for start in 0...(s2Count - s1Count) {
    var s2Freq = [Character: Int]()
    
    for end in start..<(start + s1Count) {
      // Convert integer offset to String.Index
      let index = s2.index(s2StartIndex, offsetBy: end)
      let char = s2[index]
      s2Freq[char, default: 0] += 1
    }
    
    if isMatch(s1Freq, s2Freq) {
      return true
    }
  }
  return false
}

private func isMatch(_ s1Freq: [Character: Int], _ s2Freq: [Character: Int]) -> Bool {
  for ( s1CharKey, s1CharCount) in s1Freq {
    if s2Freq[s1CharKey] != s1CharCount {
      return false
    }
  }
  return true
}

/*
    {a: 1, b: 1}
        *
    "eidbaooo", if in the map, reduce the value in the map,
                    if zero is the value... ??
        i
        r
    "eidbaooo", // if in the map,
                    create a runnder at that index
                    while runner index < end of the array or string && in the map
                        map count goes down by value at runner
                        runner += 1
        i
         r
    "eidbaooo", // if in the map,
                    create a runnder at that index
                    while runner index < end of the array or string && in the map
                        map count goes down by value at runner
                        if map count is zero remove it.
                        if mapis emoty, return true
                        runner += 1

                    reset map to original value

    return fase
    
         *
    "eidboaoo"


class Solution {
    func checkInclusionNotOmptimal(_ s1: String, _ s2: String) -> Bool {
        guard s1.count <= s2.count else { return false }
        
        var freqS1 = s1.reduce(into: [Character: Int]()) { counter, char in
            counter[char, default: 0] += 1
        }

        var s2Arr = Array(s2)
        var runner = 0

        for var index in 0..<s2Arr.count {
            runner = index
            var freqS1Copy = freqS1
            while runner < s2Arr.count && freqS1Copy[s2Arr[runner]] != nil {
                if let value = freqS1Copy[s2Arr[runner]]{
                    freqS1Copy[s2Arr[runner]] = value - 1 == 0 ? nil : value - 1
                }
                
                if freqS1Copy.isEmpty {
                    return true
                }
                runner += 1
             }
        }
        return false
    }
}
*/
