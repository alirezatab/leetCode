import UIKit

// Time: o(n)
// Space: o(n39)
func findLucky(_ arr: [Int]) -> Int {
  let frequencies = arr.reduce(into: [Int: Int]()) { counts, num in
    counts[num, default: 0] += 1
  }
  
  let luckyNumbers = frequencies.filter { $0.key == $0.value }.map { $0.key }
  
  return luckyNumbers.count == 0 ? -1 : luckyNumbers.max()!
}

print(findLucky([2,2,3,4]))
print(findLucky([1,2,2,3,3,3]))
print(findLucky([2,2,2,3,3]))

// Time: o(n)
// Space: o(n)
/*
 Time (same asymptotic, better constant):
    Original: 1 pass to build dict + 1 pass to filter + 1 pass to map + 1 pass for max = 4n operations
    Optimized: 1 pass to build dict + 1 pass to find max lucky = 2n operations
 Space (same asymptotic, better constant):
    Original: dict + intermediate array of lucky numbers = n + l (where l ≤ n)
    Optimized: only the dict = n
 
 Big O doesn’t change because:
    We drop constants: O(4n) → O(n), O(2n) → O(n)
    We care about scaling behavior, not exact operation counts
 */
func findLuckyMoreOptimized(_ arr: [Int]) -> Int {
  var maxLucky = -1
  let frequencies = arr.reduce(into: [Int: Int]()) { counts, num in
    counts[num, default: 0] += 1
  }
  
  for (num, freq) in frequencies where num == freq {
    maxLucky = max(maxLucky, freq)
  }
  
  
  return maxLucky
}

print(findLuckyMoreOptimized([2,2,3,4]))
print(findLuckyMoreOptimized([1,2,2,3,3,3]))
print(findLuckyMoreOptimized([2,2,2,3,3]))
