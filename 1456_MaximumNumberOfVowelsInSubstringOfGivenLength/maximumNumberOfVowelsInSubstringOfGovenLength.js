var maxVowels = function(s, k) {
    let maxV = 0
    let curV = 0
    var leftPtr = 0

    for (let rightPtr = 0; rightPtr < s.length; rightPtr++) {
    	if (isVowel(s[rightPtr])) {
    		curV++;
    	}
    	k--;
    	maxV = Math.max(maxV, curV);

    	if (k <= 0) {
    		if (isVowel(s[leftPtr])) {
    			curV--;
    		}
    		leftPtr++;
    		k++;
    	}
    }
    return maxV
};


var isVowel = function(ch) { 
	if (ch == "a" || ch == "e" || ch == "i" || ch == "o" || ch == "u") {
		return true
  	}
  	return false
};

console.log(maxVowels("abciiidef", 3))
console.log(maxVowels("aeiou", 2))
console.log(maxVowels("leetcode", 3))