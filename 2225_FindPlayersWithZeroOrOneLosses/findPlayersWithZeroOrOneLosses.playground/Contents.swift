
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
