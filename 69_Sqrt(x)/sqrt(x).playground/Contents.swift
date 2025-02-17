import Foundation

// Time: o(log n)
// Space: o(log n)
func mySqrtRecursive(_ x: Int) -> Int {
  if x < 2 { return x }
  let result = 2 * mySqrt(x / 4) // Recursively find sqrt(x/4)
  return result + 1 > x / (result + 1) ? result : result + 1
}

// Brute Force
// Time: o(sqrt(n))
// space: o(1)
func mySqrtNruteForce(_ x: Int) -> Int {
  if x < 2 { return x }
  var num = 1
  while num * num <= x {
    num += 1
  }
  return num - 1
}

// could Also do binary search using recursive and iteratively
// Binary Search iteratively
// Time: o(log(n))
// Space: o(1)
func mySqrtIteratively(_ x: Int) -> Int {
  if x < 2 { return x }
  
  var left = 2
  var right = x / 2
  while left <= right {
    let mid = left + (right - left) / 2
    let square = mid * mid
    if square == x {
      return mid
    } else if square < x {
      left = mid + 1
    } else {
      right = mid - 1
    }
  }
  
  return right
}

func mySqrt(_ x: Int) -> Int {
  if x < 2 { return x }
  
  func BST(left: Int, right: Int, x: Int) -> Int {
    if left > right { return right }
    
    let mid = left + (right - left) / 2
    let square = mid * mid
    
    if square == x {
      return mid
    } else if square < x {
      return BST(left: mid + 1, right: right, x: x)
    } else {
      return BST(left: left, right: mid - 1, x: x)
    }
  }
  
  return BST(left: 2, right: x / 2, x: x)
}
