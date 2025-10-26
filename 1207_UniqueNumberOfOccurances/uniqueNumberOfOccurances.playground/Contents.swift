import UIKit


// Time: o(n)
// space: o(n)
func uniqueOccurrences(_ arr: [Int]) -> Bool {
  let frequencies = arr.reduce(into: [Int: Int]()) { counts, num in
    counts[num, default:0] += 1
  }
  // Step 2: Check for unique frequencies
  /*
  var uniqueFreq = Set<Int>() // Store unique frequencies
  for freq in frequencies.values {
    if uniqueFreq.contains(freq) {
      return false // Duplicate frequency found
    }
    uniqueFreq.insert(freq)
  }
   */
  
  let isUnique = frequencies.values.reduce(into: (true, Set<Int>())) { result, freq in
    // if ture and doesnt contain freq
    if result.0, !result.1.contains(freq) {
      result.1.insert(freq)
    } else {
      result.0 = false
    }
  }.0
  
  return isUnique
}

print(uniqueOccurrences([1,2,2,1,1,3]))
print(uniqueOccurrences([1,2]))
print(uniqueOccurrences([-3,0,1,-3,1,1,1,-3,10,0]))

// Time: o(n)
// space: o(n)
// set.insert returns a tuple (insertd: Bool,  memberAfterInsert: Int))... so that you can use inserted to see if it was inseretd correcrlt or found a duplicate in there.
func uniqueOccurrencesOptimized(_ arr: [Int]) -> Bool {
  
  let freq = arr.reduce(into: [Int: Int]()) { counter, num in
    counter[num, default: 0] += 1
  }
  
  var uniqueFreq = Set<Int>()
  for val in freq.values {
    guard uniqueFreq.insert(val).inserted else { return false }
  }
  
  return true
}

print(uniqueOccurrencesOptimized([1,2,2,1,1,3]))
print(uniqueOccurrencesOptimized([1,2]))
print(uniqueOccurrencesOptimized([-3,0,1,-3,1,1,1,-3,10,0]))
