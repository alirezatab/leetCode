var reverseString = function(s) {

	let left = 0
	let right = s.length - 1

	while (left < right) {
		[s[left], s[right]] = [s[right], s[left]]
		left++
		right--
	}
}

console.log(["h","e","l","l","o"])
console.log(["H","a","n","n","a","h"])