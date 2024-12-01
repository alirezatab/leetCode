def reversePrefix(word: str, ch: str) -> str:
    i = j = 0
    arr = list(word)
    for char in word:
        if char == ch:
            while i < j:
                arr[i], arr[j] = arr[j], arr[i]
                i += 1
                j -= 1
            break
        j += 1
        
    return "".join(arr)

print(reversePrefix("abcdefd", "d"))
print(reversePrefix("xyxzxe", "z"))
print(reversePrefix("abcd", "z"))