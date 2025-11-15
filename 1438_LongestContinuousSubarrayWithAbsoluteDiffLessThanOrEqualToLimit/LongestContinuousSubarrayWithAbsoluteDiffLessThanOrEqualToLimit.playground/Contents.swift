/*
    since need to find the max and the min difference <= limit... and max and min changes the numbers, which can be a slidingn window
    we can use Monotonic Stack or queue to solve this problem
     l
     r
    [8,2,4,7]
    increasing = [8]
    decreasing = [8]
    8-8 = < limit so window is max = max(mw , left - right + 1)
     l
       r
    [8,2,4,7]
    increasing = [8] low to high -> pop 8 -> add 2 -> [2]
    decreasing = [8] high to low -> [8,2] -> [2]
    8-2 is not =< limit so item at 8 in increasing will always be bigger so need to somehow pop left of decreasing only
       l
       r
    [8,2,4,7]
    increasing = [8] low to high -> pop 8 -> add 2 -> [2]
    decreasing = [8] high to low -> [8,2] -> [2]
    8-2 is not =< limit so item at 8 in increasing will always be bigger so need to somehow pop left of decreasing only
    inc left
    then get max again, 2-2 < limit so max = max(mw , left - right + 1)
    
       l
         r
    [8,2,4,7]
    increasing = [2] low to high -> add 4 -> [2, 4]
    decreasing = [2] high to low ->  popr 2 -> add 4 [4]
    4-2 is =< limit so item at 8 in increasing will always be bigger so need to somehow pop left of decreasing only
    inc left
    then get max again, 2-2 < limit so max = max(mw , left - right + 1)  = 3-2+1 = 2 == NEWMAZ

       l
           r
    [8,2,4,7]
    increasing = [2, 4] low to high -> add 7 -> [2, 4, 7]
    decreasing = [2] high to low ->  pop 2 -> add 7 [7]
    7-2 is not =< limit so item at 8 in increasing will always be bigger so need to somehow pop left of decreasing only
    [2, 4, 7] nums[left] == first increasing --> removeFirst [4,7]
    [7]
    inc left
         l
             r
    [8,2,4,7]
    dif  7 -4 = 3 but so get maxWindow = 4-3+1 == 3
    
    var maxWindown = 0
    var left = 0
    
    for right in nums {
        while deque is not empty and topOfStak > curNum {}
            pop last element

        otherwise append to increasing

        while staks is not empty and topOfStak < curNum {}
            pop last element

        otherwise append to increasing
        
        dif = (increasing.top - decreasing.top)

        maybe a while dif  > limit  && left < right
            if if nums[left] == decreasng[left] {
                remove first of decreasing
            }

            if if nums[left] == increasing[left] {
                remove first of increasing
            }
            left += 1
            dif = (increasing.top - decreasing.top)
        }

        get max windwon
    }

*/

/*
class Solution {
    // Time: o(n^2)
    // space: o(1)
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var maxLength = 0
        var left = 0

        for right in 0..<nums.count {
            var minVal = nums[left]
            var maxVal = nums[left]
            for i in left...right {
                maxVal = max(maxVal, nums[i])
                minVal = min(minVal, nums[i])
            }

            let dif = abs(minVal - maxVal)
            if dif <= limit {
                maxLength = max(maxLength, right - left + 1)
            } else {
                left += 1
            }
        }

        return maxLength
    }
}
*/

/*
class Solution {
    // Time: o(n log n) --> o(n^2) at worst
    // space: o(n)
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var maxLength = 0
        var left = 0
        var sortedWindow = [Int]()

        for right in 0..<nums.count {
            sortedWindow.append(nums[right])
            sortedWindow.sort()

            // shrink the window
            while sortedWindow.last! - sortedWindow.first! > limit {
                if let index = sortedWindow.firstIndex(of: nums[left]) {
                    sortedWindow.remove(at: index)
                }
                left += 1
            }

            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
}
*/

/*
// using multi set / dictionary
class Solution {
    // Time: o(n * m) where multiSet.keys.min() at worst has no duplicateds and its same size as nums... so o(n ^ 2)
    // space: o(n)
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var maxLength = 0
        var left = 0
        var multiSet = [Int: Int]()

        for right in 0..<nums.count {
            // Add the current element to the multiset
            multiSet[nums[right], default: 0] += 1
            print(multiSet)

            // Ensure the condition (max - min <= limit) is satisfied
            while let minVal = multiSet.keys.min(),
                  let maxVal = multiSet.keys.max(),
                  maxVal - minVal > limit {
                
                // shrink window
                if let count = multiSet[nums[left]] {
                    if count == 1 {
                        //multiSet.removeValue(forKey: nums[left])
                        multiSet[nums[left]] = nil
                    } else {
                        multiSet[nums[left]] = count - 1
                    }
                }
                left += 1
            }

            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
  }
  */

// Time: o(n)-- max and min deque will always be the < than nums.. if nums is in, we have o(n + amortized(1)) == o(n)
// phrase it better == "Each element is added and removed from each deque at most once, so total operations are linear."
// Space: o(n + n) == o(n) since both deques are < nums in swze
func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
  // Note to self.. add index and not num to dequeue
  var maxWindow = 0
  var left = 0
  var increasingDeque = [Int]()
  var decreasingDeque = [Int]()
  
  for (right, rightNum) in nums.enumerated() {
    while let lastIndex = increasingDeque.last, nums[lastIndex] > rightNum {
      increasingDeque.popLast()
    }
    
    increasingDeque.append(right)
    
    while let lastIndex = decreasingDeque.last, nums[lastIndex] < rightNum {
      decreasingDeque.popLast()
    }
    
    decreasingDeque.append(right)
    
    // var dif = abs(nums[increasingDeque.first!] - nums[decreasingDeque.first!])
    while abs(nums[increasingDeque.first!] - nums[decreasingDeque.first!]) > limit {
      if nums[left] == nums[decreasingDeque.first!] {
        decreasingDeque.removeFirst()
      }
      
      if nums[left] == nums[increasingDeque.first!] {
        
        increasingDeque.removeFirst()
        
      }
      left += 1
      //dif = abs(nums[increasingDeque.first!] - nums[decreasingDeque.first!])
    }
    
    maxWindow = max(maxWindow, right - left + 1)
  }
  return maxWindow
}

print(longestSubarray([8,2,4,7], 4))
print(longestSubarray([10,1,2,4,7,2], 5))
print(longestSubarray([4,2,2,2,4,4,2,2], 0))

