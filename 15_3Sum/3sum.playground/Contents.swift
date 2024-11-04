import UIKit

/*
                        var result = [Int]()
                        var setC = Set<Int>()
    [-1,0,1,2,-1,-4] target == 0, for loop through array try to find a
    [-4,-1,-1,0,1,2] --> a+b+c = 0 --. -4-1+c = 0 --> (-4-1) = -c + 0 --> -(-4)-(-1) = c
      i  j          --> 5 = c, Seen = {-1}
 
 [-4,-1,-1,0,1,2] --> 5 = c, Seen = {-1}
   i     j
 
 [-4,-1,-1,0,1,2] --> 4 = c, Seen = {-1, 0}
   i       j
 
 [-4,-1,-1,0,1,2] --> 3 = c, Seen = {-1, 0, 1}
   i         j
 
 [-4,-1,-1,0,1,2] --> 2 = c, Seen = {-1, 0, 1, 2}
  i            j
 
 [-4,-1,-1,0,1,2] --> 2 = c, Seen = {-1}
      i  j
 
 [-4,-1,-1,0,1,2] --> 1 = c, Seen = {-1, 0}
      i    j
 
 [-4,-1,-1,0,1,2] --> 0 = c, Seen = {-1, 0} --> complementary target exists...
      i      j            res = [num[i], num[j], num[comp]] --> [-1,0,1]
 
 [-4,-1,-1,0,1,2] --> -1 = c, Seen = {-1, 0} --> complementary target exists...
      i        j            res = [num[i], num[j], num[comp]] --> [-1,2,-1]
 
 [-4,-1,-1,0,1,2] --> so when i > 1 --> always check if nums[i-1] == nums[i]:
     i-1 i j                                              skip to next i
                     
 [-4,-1,-1,0,1,2] --> so when i > 1 --> always check if nums[i-1] == nums[i]:
     i-1   i j                                              skip to next i
                     if i == 0, then break out of loop
 
 var result = [Int]()
 sortedArr = ...
 for i till the last element
    if nums[i] <= 0 {
        var seen = Set<Int>()
        if i > 0 && nums[i] == nums[i-1] {
            continue
        }

        for j in i+1...lastElement {
            let compTarget = -num[i]-num[j]
            if compTarget = dict[compTarget] {
                result.append([nums[i], nums[j], compTarget])
            }
            dict[num[j]] = index
        }
    }
        
        
 */

// using hashmap with Time: o(n^2)
// Space: o(n)
func threeSum1(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var sortedArr = nums.sorted()
    for i in 0..<sortedArr.count {
        guard sortedArr[i] <= 0 else { break }
        guard i == 0 || sortedArr[i] != sortedArr[i-1] else { continue }

        var seen = Set<Int>()
        var j = i + 1
        while j < sortedArr.count {
            let compTarget = -sortedArr[i] - sortedArr[j]
            if seen.contains(compTarget) {
                result.append([sortedArr[i], sortedArr[j], compTarget])
                while j + 1 < sortedArr.count && sortedArr[j] == sortedArr[j + 1] {
                    j += 1
                }
            } 
            // both ways work but else is better to save a few operations and space
//            else {
//                seen.insert(sortedArr[j])
//            }
            seen.insert(sortedArr[j])
            j += 1
        }
    }
    return result
}


print(threeSum1([-1,0,1,2,-1,-4]))
print(threeSum1([0,1,1]))
print(threeSum1([0,0,0,0]))

/*                      loop through the array
  i  j                      if dups doesnt have the nums[o]
 [-1,0,1,2,-1,-4]               dups = {-1}
                                loop through arr starting at i+1 till the end
                                    let compTarget = -nums[i] - nums [j]
                                    if seen.contains(compTarget) {
 
                                    }
                                    seen.insert()
 
 i  j
[-1,0,1,2,-1,-4]  dups = {-1}, ct = 1 - 0 --> ct = 1, seen = {0}
 
 i    j
[-1,0,1,2,-1,-4]  dups = {-1}, ct = 1 - 1 --> ct = 0, seen = {0, 1}
                        result is a set = [[-1,0,1]]
 
 i      j
[-1,0,1,2,-1,-4]  dups = {-1}, ct = 1 - 2 --> ct = -1, seen = {0, 1, 2}
 
 i         j
[-1,0,1,2,-1,-4]  dups = {-1}, ct = 1 + 1 --> ct = 2, seen = {0, 1, 2}
                        result is a set = [[-1,0,1]. [-1, -1, 2]]
 
 i            j
[-1,0,1,2,-1,-4]  dups = {-1}, ct = 1 + 4 --> ct = 5, seen = {0, 1, 2, -4}
 
    i j
[-1,0,1,2,-1,-4]  dups = {-1, 0}, ct = 0 - 1 --> ct = -1, seen = {1, }
 
    i   j
[-1,0,1,2,-1,-4]  dups = {-1, 0}, ct = 0 - 2 --> ct = -2, seen = {1, 2}
 
    i      j
[-1,0,1,2,-1,-4]  dups = {-1, 0}, ct = 0 + 1 --> ct = 1, seen = {1, 2}
                        sorted result [-1,0,1] --> when putin in set, it will just replace
                        results is a set = [[-1,0,1]. [-1, -1, 2], ]
 
 var result = Set<Int>(), dups = Set<Int>()
 var seen = Set<Int>()
 */

func threeSum(_ nums: [Int]) -> [[Int]] {
    var results = Set<[Int]>(), dups = Set<Int>()
    for i in 0..<nums.count {
        if !dups.contains(nums[i]) {
            dups.insert(nums[i])
            
            var seen = Set<Int>()
            
            for j in i+1..<nums.count {
                let compTarget = -nums[i] - nums[j]
                if seen.contains(compTarget) {
                    var result = [nums[i], nums[j], compTarget]
                    result.sort()
                    results.insert(result)
                }
                seen.insert(nums[j])
            }
        }
    }
    return Array(results)
}

/*                      loop through the array
  i  j                      if dups doesnt have the nums[o]
 [-1,0,1,2,-1,-4]               dups = {-1}
                                loop through arr starting at i+1 till the end
                                    let compTarget = -nums[i] - nums [j]
                                    if seen.contains(compTarget) {
 
                                    }
                                    seen.insert()
 
 i  j
[-1,0,1,2,-1,-4]  dups = {-1}, ct = 1 - 0 --> ct = 1, seen = {0: 0}
 
 i    j
[-1,0,1,2,-1,-4]  dups = {-1}, ct = 1 - 1 --> ct = 0, seen = {0: 0, 1:0}
                                                      seen = {0:0}
                        result is a set = [[-1,1,0]]
 
 i      j
[-1,0,1,2,-1,-4]  dups = {-1}, ct = 1 - 2 --> ct = -1, seen = {0:0, 1:0, 2:0}
                                                        seen = {0:0, 2:0}
 
 i         j
[-1,0,1,2,-1,-4]  dups = {-1}, ct = 1 + 1 --> ct = 2, seen = {0:0, 1:0, 2:0, -1:0}
                                                        seen = {0:0, 1:0, 2:0}
                        result is a set = [[-1,0,1]. [-1, -1, 2]]
 
 i            j
[-1,0,1,2,-1,-4]  dups = {-1}, ct = 1 + 4 --> ct = 5, seen = {0:0, 1:0, 2:0, -1:0, 4:0}
                                                        seen = {0:0, 1:0, 2:0, 4:0}
 
    i j
[-1,0,1,2,-1,-4]  dups = {-1, 0}, ct = 0 - 1 --> ct = -1, seen = {0:0, 1:1, 2:0, -1:0, 4:0}
 
    i   j
[-1,0,1,2,-1,-4]  dups = {-1, 0}, ct = 0 - 2 --> ct = -2, seen = {0:0, 1:1, 2:1, -1:0, 4:0}
 
    i      j
[-1,0,1,2,-1,-4]  dups = {-1, 0}, ct = 0 + 1 --> ct = 1, seen = {0:0, 1:1, 2:1, -1:1, 4:1}
                        sorted result [-1,0,1] --> when putin in set, it will just replace
                        results is a set = [[-1,0,1]. [-1, -1, 2], ]
 
 var result = Set<Int>(), dups = Set<Int>()
 var seen = Set<Int>()
 */

func threeSum2(_ nums: [Int]) -> [[Int]] {
    var results = [[Int]]()
    var dups = Set<Int>()
    var seen = [Int:Int]()
    
    for i in 0..<nums.count {
        if !dups.contains(nums[i]) {
            dups.insert(nums[i])
            
            for j in i+1..<nums.count {
                let compTarget = -nums[i] - nums[j]
                if let index = seen[compTarget], index == i  {
                    results.append([nums[i], nums[j], compTarget])
                }
                seen[nums[j]] = i
            }
        }
    }
    return results
}
