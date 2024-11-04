import UIKit

/*       s                          e      while s<e
        A man, a plan, a canal: Panama. -> check lowercase(v@start) vs lowerCase(v@end)
                                            if same, inc s, dec e

         s                          e
        A man, a plan, a canal: Panama. -> if v@s is not a character, inc s

          s                         e
        A man, a plan, a canal: Panama. -> check lowercase(v@start) vs lowerCase(v@end)
                                            if same, inc s, dec es

            s                     e
        A man, a plan, a canal: Panama. -> check lowercase(v@start) vs lowerCase(v@end)
                                            if same, inc s, dec es

               s                 e
        A man, a plan, a canal: Panama. -> if v@s is not a character, inc s
                                            if v@e is not a character, dec s

                                            if two characters are not the same, return false
*/

// Big(o)
// Time: o(n) --> n/2
// space: o(1)
func isPalindrome(_ s: String) -> Bool {
    var sArray = Array(s)
    var start = 0
    var end = sArray.count - 1
    while start < end {
        if !isCharOrDigit(char: sArray[start]) {
            start += 1
        } else if !isCharOrDigit(char: sArray[end]) {
            end -= 1
        } else if sArray[start].lowercased() !=  sArray[end].lowercased() {
            return false
        } else {
            start += 1
            end -= 1
        }
    }
    return true
}

print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("race a car"))
print(isPalindrome(" "))

func isPalindrome2(_ s: String) -> Bool {
    var sArray = Array(s)
    var start = 0
    var end = sArray.count - 1
    while start < end {
        while start < end && !isCharOrDigit(char: sArray[start]) {
            start += 1
        }

        while start < end && !isCharOrDigit(char: sArray[end]) {
            end -= 1
        }
        
        if sArray[start].lowercased() !=  sArray[end].lowercased() {
            return false
        }

        start += 1
        end -= 1
    }
    return true
}

print(isPalindrome2("A man, a plan, a canal: Panama"))
print(isPalindrome2("race a car"))
print(isPalindrome2(" "))

func isCharOrDigit(char: Character) -> Bool {
    (char >= "a" && char <= "z") || (char >= "A" && char <= "Z") || (char >= "0" && char <= "9")
}

func isPalindrome3(_ s: String) -> Bool {
    var sArray = Array(s)
    var start = 0
    var end = sArray.count - 1
    while start < end {
        while start < end && !sArray[start].isLetter && !sArray[start].isNumber {
            start += 1
        }
        
        while start < end && !sArray[end].isLetter && !sArray[end].isNumber {
            end -= 1
        }
        
        if sArray[start].lowercased() != sArray[end].lowercased() {
            return false
        }
        
        start += 1
        end -= 1
    }
    return true
}

print(isPalindrome3("A man, a plan, a canal: Panama"))
print(isPalindrome3("race a car"))
print(isPalindrome3(" "))


