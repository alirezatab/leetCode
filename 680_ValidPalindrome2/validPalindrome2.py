
def validPalindrome(s: str) -> bool:
    def isValidPalindrome(leftPtr: int, rightPtr: int) -> bool:
        while leftPtr < rightPtr:
            if s[leftPtr] != s[rightPtr]:
                return False
            leftPtr += 1 
            rightPtr -= 1  
        return True

    leftPtr = 0
    rightPtr = len(s) - 1

    while leftPtr < rightPtr:
        if s[leftPtr] != s[rightPtr]:
            return isValidPalindrome(leftPtr + 1, rightPtr) or isValidPalindrome(leftPtr, rightPtr - 1)
        leftPtr += 1
        rightPtr -= 1
    
    return True

print(validPalindrome("aba"))
print(validPalindrome("abca"))
print(validPalindrome("abc"))
print(validPalindrome("abccbda"))
        