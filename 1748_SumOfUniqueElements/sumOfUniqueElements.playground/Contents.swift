import UIKit

func sumOfUniqueShorthand1(_ nums: [Int]) -> Int {
  /*
   nums.reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1 }
   .filter { $0.value == 1 }
   .map { $0.key }
   .reduce(0, +)
   
   */
    nums.reduce(into: [Int: Int]()) { counts, num in
        counts[num, default: 0] += 1
    }
    .filter { $0.value == 1 }
    .map { $0.key }
    .reduce(0, +)
}

print(sumOfUniqueShorthand1([1,2,3,2]))
print(sumOfUniqueShorthand1([1,1,1,1,1]))
print(sumOfUniqueShorthand1([1,2,3,4,5]))

// Time: o(n)
// Space: o(n)
func sumOfUniqueShorthand2(_ nums: [Int]) -> Int {
  let frequencies = nums.reduce(into: [Int: Int]()) { counts, num in
    counts[num, default: 0] += 1
  }
  
  return frequencies.filter { $0.value == 1 }.map { $0.key }.reduce(0, +)
}

print(sumOfUniqueShorthand2([1,2,3,2]))
print(sumOfUniqueShorthand2([1,1,1,1,1]))
print(sumOfUniqueShorthand2([1,2,3,4,5]))

func sumOfUnique(_ nums: [Int]) -> Int {
    var freqCounter = [Int: Int]()
    var sum = 0

    for num in nums {
        freqCounter[num, default: 0] += 1
    }

    for (key, value) in freqCounter where value == 1 {
        sum += key
    }

    return sum
}

print(sumOfUnique([1,2,3,2]))
print(sumOfUnique([1,1,1,1,1]))
print(sumOfUnique([1,2,3,4,5]))
