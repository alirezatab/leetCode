/*
    deadEnds are an array but better to put them in a visited Set, so we can bypass them
    // minimum total number of turns required to open the lock - SO BFS

    questiosn, will input always be 1-9. yes digist only
    can the total string be so huge, that it wont fit in an int? Ex: "10^1000000" No



    // need to put all the possible answers in the que, and then pop... so i for loop through string and update each character, each time
    /// when to turn it into an int?
    // how to do role over?

// easy way to map current prevNum and next Num map
// another math way is to use regular if statment .. easiest to understand
// use modulus for wrapped things like this or array that is a cycle... a bit harder

so if num == 9 && direction == 1
    num = 0
else if (num % 10) - direction ==
    add s
    9 + 1 (direcition) == 10, num = 0
    0 - 1 direction == -1, num = 9

    so for BFS
    Queue = [(0000, 0)]
    visited = Set(deadends) + 0000

    let direction (1, -1)

    while !queue.isEmpty {
        let numberStr, step = deque

        if numStr == target, return step

        for char in numberStr {
             var num = Int(String(char))!

            for direction in directon {
                if num == 9 && d == 1 { num = 0 }
                else if num == 0 && d == -1 { num = 9 }
                else {num =+ d}

                let newStr = numberStr.prefix(i) + String(num) + numStr.dropFirst(i+1)

                if !set.contains(newStr) {
                    add to queue(newStr, step +1)
                    add to set
                }
            }
        }
    }

    above is BFS... but i need to track min steps, so maybe add it to the queue
*/
/*
// Time:
In BFS: O(kⁿ + d) or O(kⁿ ⋅ work_per_state + d)
Thus, total time:
    O(kⁿ ⋅ n² + d)
If using mutable state (e.g., C++ vector), it becomes:
    O(kⁿ ⋅ n + d)
*/

// Space: O(k^n + d) --> d is for number of digits 0-9
/*
We store:
    1. visited set: up to 10,000 entries (all combos + deadends)
    2. Queue: in worst case, holds all states (though typically less)
So:
    * Space = O(10⁴) = O(1) (again, due to fixed input size)
    * Generalized: O(kᵈ)
Note: Using index vs removeFirst() doesn’t change asymptotic space — both may store all states.
But index avoids shifting, so better constant factor and no hidden O(n) cost.
*/


func openLock(_ deadends: [String], _ target: String) -> Int {
  var visited = Set(deadends)
  guard !visited.contains("0000") else {
    return -1
  }
  let directions = [1, -1]
  var queue = [("0000", 0)]
  visited.insert("0000")
  var index = 0
  
  while index < queue.count {
  //while !queue.isEmpty {
    //let (newStr, step) = queue.removeFirst() // instead of removeFirst and shifrting, use index
    let (newStr, step) = queue[index]
    index += 1
    
    if newStr == target {
      return step
    }
    
    for (i, char) in newStr.enumerated() {
      var num = Int(String(char))!
      
      for direction in directions {
        // option 1
        /*
         var newNum = num
         if num == 9 && direction == 1 {
            newNum = 0
         } else if num == 0 && direction == -1 {
            newNum = 9
         } else {
            newNum += direction
         }
         
         let newStr = String(newStr.prefix(i) + String(newNum) + newStr.dropFirst(i + 1))
         */
        
        // option 2
        /*
         var newDigit = num + direction
         if newDigit == 10 {
            newDigit = 0
         } else if newDigit == -1 {
            newDigit = 9
         }
         
         let newStr = String(newStr.prefix(i) + String(newDigit) + newStr.dropFirst(i + 1))
         */
        
        // option 3
        let newModifiedModuloDigitForSwift = (num + direction + 10) % 10
        let newStr = String(newStr.prefix(i) + String(newModifiedModuloDigitForSwift) + newStr.dropFirst(i + 1))
        
        if !visited.contains(newStr) {
          queue.append((newStr, step + 1))
          visited.insert(newStr)
        }
      }
    }
  }
  
  return -1
}

print(openLock(["0201","0101","0102","1212","2002"], "0202"))
print(openLock(["8888"], "0009"))
print(openLock(["8887","8889","8878","8898","8788","8988","7888","9888"], "8888"))
