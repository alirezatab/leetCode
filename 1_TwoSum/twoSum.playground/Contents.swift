import Foundation

/*
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.

Example 1:
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

Example 2:
Input: nums = [3,2,4], target = 6
Output: [1,2]

Example 3:
Input: nums = [3,3], target = 6
Output: [0,1]
*/

/*
    Brute Force: Have two arrays and find matching pair if possible
*/

/*
     *
[2,7,11,15], target = 9
9 - 2 = 7
k | V.
------
7   i = 0

   *
[2,7,11,15], target = 9
9 - 2 = 7
k | V.
------
7   i = 0
*/

/*
initilize an empty dictiondary
for loop through the array
    check to see if the dictionary contains the key num[i]
        return [current index, dic[num[i]]
    get remainder --> reaminder = target - num[i]
    dictionary[remainder] is equal to index

dic has num[i], no, get remainder and add to the dictionary containing remainder as key and index as value
*/

/*

 *
[3,2,4], target = 6 --> dic has num[i] --> NO
                          6 - 3 = 3 --> add to the dictionary containing remainder as key and index as value
k | V.
------
3   0

   *
[3,2,4], target = 6 --> dic has num[i] --> NO
                          6 - 2 = 4 --> add to the dictionary containing remainder as key and index as value
k | V.
------
3   0
4   1

     *
[3,2,4], target = 6 --> dic has num[i] --> Yes
                           return [1 , 2]
k | V.
------
3   0
4   1
*/

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numMapping = [Int:Int]()
    for (currentIndex, value) in nums.enumerated() {
        if let savedIndex = numMapping[value] {
            return [savedIndex, currentIndex]
        }
        let remainder = target - value
        numMapping[remainder] = currentIndex
    }
    return []
}

print(twoSum([2,7,11,15], 9))
print(twoSum([3,2,4], 6))
print(twoSum([3,3], 6))
