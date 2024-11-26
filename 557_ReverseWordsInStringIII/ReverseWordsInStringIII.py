def reverseWords(s: str) -> str:
    left = right = 0
    # Convert the string to a list of characters (mutable)
    sArr = list(s)

    for i in range(len(s)):
        if sArr[i] == " ":
            # Reverse the word when a space is encountered
            while left < right:
                sArr[left], sArr[right] = sArr[right], sArr[left]
                left += 1
                right -= 1
            # Move left to the start of the next word
            left = i + 1
        right = i

    # Reverse the last word (after the last space)
    while left < right:
        sArr[left], sArr[right] = sArr[right], sArr[left]
        left += 1
        right -= 1

    # Convert the list back to a string
    return "".join(sArr)


print(reverseWords("Let's take LeetCode contest"))
print(reverseWords("Mr Ding"))
