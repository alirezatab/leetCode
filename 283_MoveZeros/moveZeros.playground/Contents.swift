import Foundation
/*                          2 pointer loop through the array
         i
         j
        [0,1,0,3,12] if pointer @j == 0, inc j

         i
           j         if pointer @j != 0 swap value @i and @j and then move loop through i till i is not 0
        [0,1,0,3,12]

           i
           j
        [1,0,0,3,12]  if pointer @j == 0, inc j

           i
             j
        [1,0,0,3,12]  if pointer @j == 0, inc j
           i
               j
        [1,0,0,3,12]  if pointer @j != 0 swap value @i and @j and then move loop through i till i is not 0
           i
                  j
        [1,3,0,0,12]
             i
                  j
        [1,3,0,0,12]  if pointer @j != 0 swap value @i and @j and then move i to j index

                i
                  j
        [1,3,12,0,0]  if pointer @j != 0 swap value @i and @j and then move loop through i till i is not 0
              i
              j
        [2,1]

let i = 0
let j = j
while @j < arr count - 1
    if num @j == 0
        inc j
    else
        swap value @i and Value @j
        while  @i != 0 and i < j
            inc i
*/

// faster solution
// o(1) space
// 0(N)


func moveZeroesOption1(_ nums: inout [Int]) {
    guard nums.count > 1 else { return }
    var i = 0
    var j = 0
    while j < nums.count {
        if nums[j] == 0 {
            j += 1
        } else {
            (nums[i],nums[j]) = (nums[j],nums[i])
            j += 1
            while nums[i] != 0 && i < j && j < nums.count {
                i += 1
            }
        }
    }
    print(nums)
}

var arr = [0,1,0,3,12]
moveZeroesOption1(&arr)
//arr = [0]
//moveZeroesOption1(&arr)
//arr = [1,2]
//moveZeroesOption1(&arr)

func moveZeroesOption2(_ nums: inout [Int]) {
    guard nums.count > 1 else { return }
    var i = 0
    var j = 0
    while j < nums.count {
      while nums[j] == 0 && j < nums.count - 1 {
            j += 1
      }
      
      (nums[i],nums[j]) = (nums[j],nums[i])
      j += 1
      
      while nums[i] != 0 && i < j && i < nums.count - 1 {
          i += 1
      }
    }
    print(nums)
}

arr = [0,1,0,3,12]
moveZeroesOption2(&arr)
//arr = [0]
//moveZeroesOption2(&arr)
//arr = [1,2]
//moveZeroesOption2(&arr)


func moveZeroesOption3(_ nums: inout [Int]) {
    guard nums.count > 1 else { return }
    var i = 0
    var j = 1
    while j < nums.count {
      while nums[j] == 0 && j < nums.count - 1 {
          j += 1
      }
      
      while nums[i] != 0 && i < j && i < nums.count - 1 {
          i += 1
      }
      
      (nums[i],nums[j]) = (nums[j],nums[i])
      j += 1
      i += 1
    }
    print(nums)
}

arr = [0,1,0,3,12]
moveZeroesOption3(&arr)
//arr = [0]
//moveZeroesOption3(&arr)
//arr = [1,2]
//moveZeroesOption3(&arr)

// leetcode best optimal solution
func moveZeroesOption4(_ nums: inout [Int]) {
  var lastNonZeroFoundAt = 0
  
  // Move all non-zero elements to the front
  for cur in 0..<nums.count {
    if nums[cur] != 0 {
      nums[lastNonZeroFoundAt] = nums[cur]
      lastNonZeroFoundAt += 1
    }
  }
  
  // Fill the remaining positions with zeroes
  for i in lastNonZeroFoundAt..<nums.count {
    nums[i] = 0
  }
}

arr = [0,1,0,3,12]
moveZeroesOption4(&arr)
