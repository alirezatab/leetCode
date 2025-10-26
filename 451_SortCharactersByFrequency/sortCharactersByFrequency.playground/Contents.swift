import UIKit

// Time Complexity: O(n + k log k)
// Space Complexity: O(n + k)


func frequencySortLongversion(_ s: String) -> String {
  var result = ""
  let frequencies = s.reduce(into: [Character: Int]()) { counter, char in
    counter[char, default: 0] += 1
  }
  
  let sortedFrequenies = frequencies.sorted { $0.value > $1.value }
  
  for (char, freq) in sortedFrequenies {
    let str = String(repeating: char, count: freq)
    result.append(str)
  }
  
  return result
}

print(frequencySortLongversion("tree"))
print(frequencySortLongversion("cccaaa"))
print(frequencySortLongversion("Aabb"))

/*
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
 Time Complexity: O(n + k log k)

 Where:
 n = length of input string s
 k = number of unique characters in s
 
 Breakdown:
 1. Building frequencies: O(n)
  * Iterate through each character in the string once
 
 2. Sorting by frequency: O(k log k)
  * Sort the dictionary entries (at most k unique characters)
 
 3. Mapping to strings: O(n)
  * Create strings with total length n (sum of all frequencies = n)
 
 4. Joining strings: O(n)
  * Concatenate all character strings into final result
 
 Total: O(n + k log k + n + n) = O(n + k log k)

 Since k ≤ n (you can't have more unique characters than total characters), worst case is O(n log n) when all characters are unique.

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
 
 Space Complexity: O(n + k)

 Breakdown:
  1. Frequencies dictionary: O(k)
  2. Sorted array of key-value pairs: O(k)
  3. Mapped array of strings: O(n)
    * Stores all characters in string form before joining
  4.Final result string: O(n)
 Total: O(k + k + n + n) = O(n + k)
 */

func frequencySort(_ s: String) -> String {
  let frequencies = s.reduce(into: [Character: Int]()) { counter, char in
    counter[char, default: 0] += 1
  }
  
  return frequencies
    .sorted { $0.value > $1.value }
    .map { String(repeating: $0.key, count: $0.value) }
    .joined()
}


print(frequencySort("tree"))
print(frequencySort("cccaaa"))
print(frequencySort("Aabb"))
