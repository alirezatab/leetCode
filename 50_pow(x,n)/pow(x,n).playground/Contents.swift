import UIKit

/*
 Implement pow(x, n), which calculates x raised to the power n (i.e., xn).
 
 Example 1:
 Input: x = 2.00000, n = 10
 Output: 1024.00000
 
 Example 2:
 Input: x = 2.10000, n = 3
 Output: 9.26100
 
 Example 3:
 Input: x = 2.00000, n = -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25
 
 BruteForce
 o(N) time
 o(1) Space
 check if n is zero, return 1
 total = 1
 loop through 1-n
    total *= x
 if n is negative, return 1/n
 

 
 better Solution
 if n is even -->
                2^4     is same as (x*x)^n/2               4^2
 2*2 = 4 --> 2*2*2*2 --> 16 which is 4*4 = 16
 2^6 -> 4^3
 2*2*2*2*2*2 -->  -->
 
 if n is odd
 x * ((x*x)^((n-1)/2))
 2^5
 2 * 2^4
 if n % 2 == 1 {
    return x * myPow(x * x, ))
 }
 1 / (x, -1 * n)
 */

// Big O:
// Time: o(log n)
// Space: o(log n)
func myPow(_ x: Double, _ n: Int) -> Double {
    guard n != 0 else { return 1 }
    guard n > 0 else { return  1 / myPow(x, (-1 * n)) }
    if n % 2 == 1 {
        return x * myPow(x * x, (n-1) / 2)
    }
    return myPow(x * x, n / 2)
}

print(myPow(2.00000, 10))
print(myPow(2.10000, 3))
print(myPow(2.00000, -2))


// Iterative
// Big O:
// Time: o(log n)
// Space: o(1)
func myPow2(_ x: Double, _ n: Int) -> Double {
    guard n != 0 else { return 1 }
    var x = x, n = n
    
    if n < 0 {
        n = -n
        x = 1.0 / x
    }
    
    var result = 1.0
    while n != 0 {
        if n % 2 == 1 {
            result *= x
            n -= 1
        }
        
        x *= x
        n /= 2
    }
    
    return result
}

print(myPow2(2.00000, 10))
print(myPow2(2.10000, 3))
print(myPow2(2.00000, -2))

