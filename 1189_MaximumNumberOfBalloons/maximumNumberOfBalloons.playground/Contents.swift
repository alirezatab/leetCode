import UIKit


/*
 loonbalxballpoon {b: 0, a: 0, l: 0, o: 0, n: 0}
 loonbalxballpoon
 loonbalxballpoon {b: 2, a: 2, l: 4, o: 2, n: 2}
 */
func maxNumberOfBalloons(_ text: String) -> Int {
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

print(maxNumberOfBalloons("nlaebolko"))
print(maxNumberOfBalloons("loonbalxballpoon"))
print(maxNumberOfBalloons("leetcode"))

