# Time: o(n + m)
# space: o(1)
def getCommon(nums1: List[int], nums2: List[int]) -> int:
    i = j = 0

    while i < len(nums1) and j < len(nums2):
        if nums1[i] == nums2[j]:
            return nums1[i]
        elif nums1[i] < nums2[j]:
            i += 1
        else:
            j += 1

    return -1

print(getCommon([1, 2, 3], [4, 5, 6]))
print(getCommon([1, 2, 3], [2, 4]))
print(getCommon([1, 2, 3, 6], [2, 3, 4, 5]))

# there is a binary search way of doing it also. try that if you come across this problem