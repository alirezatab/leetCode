var largestAltitude = function(gain) {
    let highestAlt = 0
    let currentAlt = 0

    for (let i = 0; i < gain.length; i++) {
    	currentAlt += gain[i]
    	highestAlt = Math.max(currentAlt, highestAlt)
    }

    return highestAlt
};

console.log(largestAltitude([-5,1,5,0,-7]))
console.log(largestAltitude([-4,-3,-2,-1,4,3,2]))