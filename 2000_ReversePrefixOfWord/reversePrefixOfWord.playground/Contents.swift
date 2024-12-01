import Foundation

func reversePrefix(_ word: String, _ ch: Character) -> String {
    var i = 0
    var j = 0
    var wordArr = Array(word)

    for char in word {
        if char == ch {
            while i < j {
                (wordArr[i], wordArr[j]) = (wordArr[j], wordArr[i])
                i += 1
                j -= 1
            }
            break
        }
        j += 1
    }
    return String(wordArr)
}

print(reversePrefix("abcdefd", "d"))
print(reversePrefix("xyxzxe", "z"))
print(reversePrefix("abcd", "z"))
