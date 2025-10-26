import UIKit


/*
 loonbalxballpoon {b: 0, a: 0, l: 0, o: 0, n: 0}
 loonbalxballpoon
 loonbalxballpoon {b: 2, a: 2, l: 4, o: 2, n: 2}
 */
// Time: o(n + m) -> k at max can be 26 so we say o(n + m)
// Space: o(k) --. K also being 26 at max so we can also say o(1)
func maxNumberOfBalloonsOneDict(_ text: String) -> Int {
  var dict: [Character: Int] = ["b": 0, "a": 0, "l": 0, "o": 0, "n": 0]
  var ans = Int.max
  
  for char in text {
    if let count = dict[char] {
      dict[char] = count + 1
    }
  }
  
  for (key, val) in dict {
    if key == "l" || key == "o" {
      ans = min(ans, val / 2)
    } else {
      ans = min(ans, val)
    }
  }
  
  return ans
}

print(maxNumberOfBalloonsOneDict("nlaebolko"))
print(maxNumberOfBalloonsOneDict("loonbalxballpoon"))
print(maxNumberOfBalloonsOneDict("leetcode"))

// Time: o(n)
// Space: o(1)
func maxNumberOfBalloons(_ text: String) -> Int {
    var bCounter = 0
    var aCounter = 0
    var lCounter = 0
    var oCounter = 0
    var nCounter = 0
    
    for char in text {
        if char == "b" {
            bCounter += 1
        } else if char == "a" {
            aCounter += 1
        } else if char == "l" {
            lCounter += 1
        } else if char == "o" {
            oCounter += 1
        } else if char == "n" {
            nCounter += 1
        }
    }
    
    lCounter /= 2
    oCounter /= 2
    
    return [bCounter, aCounter, lCounter, oCounter, nCounter].min()!
}


print(maxNumberOfBalloons("nlaebolko"))
print(maxNumberOfBalloons("loonbalxballpoon"))
print(maxNumberOfBalloons("leetcode"))

// Time: o(n + m + k) -> k at max can be 26 so we say o(n + m)
// Space: o(k) --. K also being 26 at max so we can also say o(1)
func maxNumberOfBalloonsTwoDict(_ text: String) -> Int {
    var pattern = "balloon"
    var patternFreq = [Character: Int]()
    var wordFreq = [Character: Int]()
    var ans = Int.max

    for char in pattern {
        patternFreq[char, default: 0] += 1
    }
    
    for char in text {
        wordFreq[char, default: 0] += 1
    }
    
    for (key, patternCharCount) in patternFreq {
        if let wordCharCount = wordFreq[key] {
            ans = min(ans, wordCharCount / patternCharCount)
        } else {
            return 0
        }
    }
    
    return ans
}

print(maxNumberOfBalloonsTwoDict("nlaebolko"))
print(maxNumberOfBalloonsTwoDict("loonbalxballpoon"))
print(maxNumberOfBalloonsTwoDict("leetcode"))
