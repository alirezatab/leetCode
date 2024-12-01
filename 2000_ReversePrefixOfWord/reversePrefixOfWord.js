var reversePrefix = function(word, ch) {
    let i = 0
    let j = 0
    let arr = [...word]
    for (let k = 0; k < arr.length; k++) {
        if (arr[k] == ch) {
            while (i < j) {
                [arr[i], arr[j]] = [arr[j], arr[i]]
                i++
                j--
            }
            break
        }
        j++
    }
    return arr.join("")
};


console.log(reversePrefix("abcdefd", "d"))
console.log(reversePrefix("xyxzxe", "z"))
console.log(reversePrefix("abcd", "z"))