def largestAltitude(gain: List[int]) -> int:
    currentAlt = highestAlt = 0
    for g in gain:
        currentAlt += g
        highestAlt = max(currentAlt, highestAlt)

    return highestAlt

print(largestAltitude([-5,1,5,0,-7]))
print(largestAltitude([-4,-3,-2,-1,4,3,2]))