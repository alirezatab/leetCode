
// Time complexity: O(n⋅logn)
// For each match in matches, we need to update the value of both players in losses_count. Operations on hash map require O(1) time. Thus the iteration over matches takes O(n) time.
// We need to store two kinds of players in two arrays and sort them. In the worst-case scenario, there may be O(n) players in these arrays, so it requires O(n⋅logn) time.
// To sum up, the time complexity is O(n⋅logn).

// Space complexity: O(n)
// We use a hash map to store all players and their number of losses, which requires O(n) space in the worst-case scenario.
func findWinnersHashMap(_ matches: [[Int]]) -> [[Int]] {
  var resultTracker = [Int: Int]()
  for match in matches {
    let winner = match[0]
    let loser = match[1]
    // winner
    if resultTracker[winner] == nil {
      resultTracker[winner] = 0
    }
    
    // loser
    if var lostCount = resultTracker[loser] {
      lostCount += 1
      resultTracker[loser] = lostCount
    } else {
      resultTracker[loser] = 1
    }
  }
  
  var winner = [Int]()
  var loser = [Int]()
  for (player, lossCount) in resultTracker {
    if lossCount == 0 {
      winner.append(player)
    }
    if lossCount == 1 {
      loser.append(player)
    }
  }
  
  return [winner.sorted(), loser.sorted()]
}

print(findWinnersHashMap(
  [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]])
)
print(findWinnersHashMap([[2,3],[1,3],[5,4],[6,4]]))
    
// counting
// Time Complexity: o(n + k)
//  - For each match, we need to update two values in the array losses_count which takes constant time. Thus the iteration requires O(n) time.
//  - We need to iterate over losses_count to collect two kinds of players, which takes O(k) time.
//  - Since we iterate over players from low to high, we don't need to sort them anymore.
//  - To sum up, the overall time complexity is O(n+k).

// Space Complexity: o(k)
//   - We need to create an array of size O(k) to cover all players. Thus the overall space complexity is O(k).
func findWinners(_ matches: [[Int]]) -> [[Int]] {
  var lossesCount = [Int](repeating: -1, count: 100001)
  
  for match in matches {
    let winner = match[0]
    let loser = match[1]
    if lossesCount[winner] == -1 {
      lossesCount[winner] = 0
    }
    
    if lossesCount[loser] == -1 {
      lossesCount[loser] = 1
    } else {
      lossesCount[loser] += 1
    }
  }
  
  var winner = [Int]()
  var loser = [Int]()
  for player in 1..<lossesCount.count {
    if lossesCount[player] == 0 {
      winner.append(player)
    } else if lossesCount[player] == 1 {
      loser.append(player)
    }
  }
  
  return [winner, loser]
}

print(findWinners(
  [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]])
)
print(findWinners([[2,3],[1,3],[5,4],[6,4]]))


/*
 matches = [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]

lossCounter = {1:0, 3: 2, 2:0, 6:2, 5:1, 7:1, 4:1, 8:1, 9:2, 10: 0}

noLoss = []
oneLoss = []
if key is zero, add to the list
    [1,2,10] ==> no loss
    [5,7,4,8] ==> one loss

the sort each of the arrays
and return in array of arrays

using countig
create an array with the size of array +1 and init with -1
matches = [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]
[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
  0 1
[[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]
[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

go through the mathces, and map the winner and loser to the array
    if winner aka (match[0]) as index == -1 {
        make that index = 0
          0 1
        [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]
        [-1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1]
    }

    if loser aks (match[1]) as index == -1 {
        make the value at that index = 1
            
        [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]
        [-1, 0, -1, 1, -1, -1, -1, -1, -1, -1, -1]
    } else {
        inc value at that index by 1
    }
}

winnerArry
loserArray
for loop counter
    if == 0
        append to winnerArray
    else if == 1
        append to oneLoserArr

return [winnerArr, LoserArr]
*/
/*
class Solution {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var lossCounter = [Int: Int]()
        var zeroLoss = [Int]()
        var oneLoss = [Int]()
        
        for match in matches {
            lossCounter[match[0], default: 0] += 0
            lossCounter[match[1], default: 0] += 1
        }
        
        for (key, value) in lossCounter {
            if value == 0 {
                zeroLoss.append(key)
            } else if value == 1 {
                oneLoss.append(key)
            }
        }
        
        return [zeroLoss.sorted(), oneLoss.sorted()]
    }
}
*/

class Solution {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var zeroLoss = [Int]()
        var oneLoss = [Int]()
        var counter = Array(repeating: -1, count: matches.count + 1)
    
        for match in matches {
            let winner = match[0]
            let loser = match[1]
            if counter[winner] == -1 {
                counter[winner] == 0
            }
            
            print(counter)
            
            if counter[loser] == -1 {
                counter[loser] = 0
            } else {
                counter[loser] += 1
            }
            print(counter)
        }
        

        
        var noLossArr = [Int]()
        var oneLossArr = [Int]()
        
        for (i, count) in counter.enumerated() {
            if count == 0 {
                noLossArr.append(i)
            } else if count == 1 {
                oneLossArr.append(i)
            }
        }
        
        return [noLossArr, oneLossArr]
    }
}
