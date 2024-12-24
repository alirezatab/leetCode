def maxVowels(s: str, k: int) -> int:
    curV = 0
    maxV = 0
    leftPtr = 0

    for rightPtr in range(len(s)):
        if self.isVowel(s[rightPtr]):
            curV += 1
        k -= 1
        maxV = max(maxV, curV)

        if k <= 0:
            if self.isVowel(s[leftPtr]):
                curV -= 1
            leftPtr += 1
            k += 1
    return maxV

def isVowel(ch: str) -> bool:
    if ch == "a" or ch == "e" or ch == "i" or ch == "o" or ch == "u":
        return True
  
    return False

print(maxVowels("abciiidef", 3))
print(maxVowels("aeiou", 2))
print(maxVowels("leetcode", 3))