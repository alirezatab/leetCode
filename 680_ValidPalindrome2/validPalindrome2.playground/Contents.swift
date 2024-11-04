import Foundation

/*
 Given a string s, return true if the s can be palindrome after deleting at most one character from it.

 Example 1:

 Input: s = "aba"
 Output: true

 Example 2:
 Input: s = "abca"
 Output: true
 Explanation: You could delete the character 'c'.
 
 Example 3:
 Input: s = "abc"
 Output: false
            
    l r -- if left and right are the same, move left one up and right one down
    aba
    / \
 
     r
     l if left and right are the same and or same index, return true
    aba
    / \
 
    l  r  -- if left and right are the same, move left++ up and right-- one down
    abca
 
     lr  -- if left and right are the not the same, recrusively pass left as one option and right as another option only once
    abca
    / \
   b   c since left and right will be the same here, then we return true
 
    l r
    abc -- if value on left and right not the same, do recrusive call again
    / \
   ab  bc
   lr  lr --> not the same again so false
 
            l   r
            abbca --> same so l++, r--
             
             l r
            abbca --> not same recrusive, new function that passes both left and right
             / \
            bb bc --> one is palindrome and another is not so it is palindrome
 
 
 var leftPtr = 0
 var rigthPtr = s.count - 1
 while leftPtr is less than rightPtr
    if char at left Ptr == chat at right ptr
        inc leftPtr
        dec rightPtr
    else
        use helper function isPalindrome(leftPtr, rightPtr) -> Bool
        return isPalindrome(leftPtr+1, rightPtr) || isPalindrome(leftPtr, rightPtr01)
 
    func isPalindrome(..., ...) -> Bool
        var leftPtr = leftPtr
        var rigthPtr = rightPtr
        while leftPtr is less than rightPtr
            if char at leftPtr == char at rightPtr
                inc left pointer
                dec right pointer
            else
                return false
 
        reutrn true

    
 
 
 return true
 
 */

// Big O
// Time: o(N)
// Space: o(1)
func validPalindrome(_ s: String) -> Bool {
    var leftPtr = 0
    var rightPtr = s.count - 1
    var sArray = Array(s)
    
    while leftPtr < rightPtr {
        if sArray[leftPtr] != sArray[rightPtr] {
            return isPalindrome(leftPtr+1, rightPtr) || isPalindrome(leftPtr, rightPtr-1)
        }

        leftPtr += 1
        rightPtr -= 1
    }
    
    func isPalindrome(_ leftPtr: Int, _ rightPtr: Int) -> Bool {
        var leftPtr = leftPtr
        var rightPtr = rightPtr
        while leftPtr < rightPtr {
            if sArray[leftPtr] != sArray[rightPtr] {
                return false
            }
            leftPtr += 1
            rightPtr -= 1
        }
        return true
    }
    
    return true
    
}

print(validPalindrome("aba"))
print(validPalindrome("abca"))
print(validPalindrome("abc"))
print(validPalindrome("abbca"))
