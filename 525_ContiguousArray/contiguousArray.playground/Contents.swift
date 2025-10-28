import UIKit

/*

this is like sliding window but the window is adjustable so how to keep track of the index
dic[index] --> indexTracker will be the left... and right - left will be the max vs maxLength

so lets say when we see zero, we subtract 1, when we see 1, we add 1, so at empty array, count 0: index:1

var maxLength = 0
var count = 0
countIndexMapper = [0: -1]

need to loop through the array... so thats will be my right index

 *
[0,1,1,1,1,1,0,0,0] when we seee zero, count -= 1 ==> -1, check the window..
                    dic[count] exists or not --> no --> add it to the dictionary {0: -1, -1: 0}

   *
[0,1,1,1,1,1,0,0,0] when we seee zero, count += 1 ==> count was -1, so now 0, check the window..
                    dic[0] exists or not --> yes... --> so get the windown
                    1 - (-1) = 2 == maxLength

     *
[0,1,1,1,1,1,0,0,0] count = 1 ==> {0: -1, -1: 0, 1: 2}

       *
[0,1,1,1,1,1,0,0,0] count = 2 ==> {0: -1, -1: 0, 1: 2, 2: 3}
                    
         *
[0,1,1,1,1,1,0,0,0] count = 3 ==> {0: -1, -1: 0, 1: 2, 2: 3, 3: 4}

           *
[0,1,1,1,1,1,0,0,0] count = 4 ==> {0: -1, -1: 0, 1: 2, 2: 3, 3: 4, 4: 5}

             *
[0,1,1,1,1,1,0,0,0] count = 4-1 = 3 ==> {0: -1, -1: 0, 1: 2, 2: 3, [3: 4], 4: 5}
                    right - left ==> 6 - 4 = 2 ml = max(mL, 2)

               *
[0,1,1,1,1,1,0,0,0] count = 3-1 = 2 ==> {0: -1, -1: 0, 1: 2, [2: 3], 3: 4, 4: 5}
                    right - left ==> 7 - 3 = 4 ml = max(2, 4) ==> ml = 4

                 *
[0,1,1,1,1,1,0,0,0] count = 2-1 = 1 ==> {0: -1, -1: 0, [1: 2], 2: 3, 3: 4, 4: 5}
                    right - left ==> 8 - 2 = 6 ml = max(4, 6) ==> ml = 6

return 6
*/

func findMaxLength(_ nums: [Int]) -> Int {
  var count = 0
  var maxLength = 0
  var countMap: [Int : Int] = [0: -1]
  for (curIndex, num) in nums.enumerated() {
    count += num == 1 ? 1 : -1
    if let savedIndex = countMap[count] {
      let length = curIndex - savedIndex
      maxLength = max(maxLength, length)
    } else {
      countMap[count] = curIndex
    }
  }
  return maxLength
}

print(findMaxLength([0,1]))
print(findMaxLength([0,1,0]))
print(findMaxLength([0,1,0,1,1,1,0,1,0]))
