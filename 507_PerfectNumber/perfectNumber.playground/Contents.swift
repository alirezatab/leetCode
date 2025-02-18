import UIKit


// Time: o(sqrt(N))
// Space o(1)
func checkPerfectNumber(_ num: Int) -> Bool {
  if num <= 1 { return false }
  
  var sum = 1
  var divisor1 = 2
  var divisor2 = 0
  
  repeat {
    if num % divisor1 == 0 {
      divisor2 = num / divisor1
      if divisor1 != divisor2 {
        sum += divisor1 + divisor2
      }
    }
    divisor1 += 1
  } while (divisor1 < divisor2)
  
  return sum == num
}

print(checkPerfectNumber(28)) // true
print(checkPerfectNumber(7)) // false


// Time: o(sqrt(N))
// Space o(1)
func checkPerfectNumberChatGPT(_ num: Int) -> Bool {
  if num <= 1 { return false }
  
  var sum = 1
  var divisor1 = 2
  
  while divisor1 * divisor1 <= num { // we check square root of 1, so more effecient
    if num % divisor1 == 0 {
      let divisor2 = num / divisor1
      sum += divisor1
      // Avoid double counting when divisor1 == divisor2
      if divisor1 != divisor2 {
        sum += divisor2
      }
    }
    divisor1 += 1
  }
  
  return sum == num
}

print(checkPerfectNumberChatGPT(28)) // true
print(checkPerfectNumberChatGPT(7)) // false

