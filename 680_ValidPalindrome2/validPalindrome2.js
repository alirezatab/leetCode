var validPalindrome = function(s) {
        var isValidPalindrome = function(leftPtr, rightPtr) {
        while (leftPtr < rightPtr) {
            if (s[leftPtr] != s[rightPtr]) {
                return false
            }
            leftPtr++
            rightPtr--
        }    
        return true
    };
    
    let leftPtr = 0
    let rightPtr = s.length - 1

    while (leftPtr < rightPtr) {
        if (s[leftPtr] != s[rightPtr]) {
            return isValidPalindrome(leftPtr + 1,rightPtr) ||
                    isValidPalindrome(leftPtr, rightPtr - 1)
        }
        leftPtr++
        rightPtr--
        
    }

    return true
};

console.log(validPalindrome("aba"))
console.log(validPalindrome("abca"))
console.log(validPalindrome("abc"))
console.log(validPalindrome("abccbda"))