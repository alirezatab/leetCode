var isPalindrome = function(s) {
    let start = 0;
    let end = s.length - 1;

    const isAlphanumeric = (char) => /[a-zA-Z0-9]/.test(char);

    while (start < end) {
        while (start < end && !isAlphanumeric(s[start])) {
            start += 1;
        }

        while (start < end && !isAlphanumeric(s[end])) {
            end -= 1;
        }

        if (s[start].toLowerCase() !== s[end].toLowerCase()) {
            return false;
        }

        start += 1;
        end -= 1;
    }
    return true;
};

console.log(isPalindrome("A man, a plan, a canal: Panama"))
console.log(isPalindrome("race a car"))
console.log(isPalindrome(" "))
