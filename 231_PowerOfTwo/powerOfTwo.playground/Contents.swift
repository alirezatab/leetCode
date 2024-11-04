/*
2^4 = 16
2^3 = 8
2^2 = 4
2^1 = 2
2^0 = 1 means divisible by 2... so that means n % 2 == 0
                    /2      /2      /2      /2      /2
                16 ----> 8 ----> 4 ----> 2 ----> 1 ----> 0
                3 ----> 2 ----> 1 ----> 0
we ned to call this recruisively and dvide by 2
and reutrn our base case --> isPowerOfTwo(n/2)

--> return n % 2 == 0 && isPowerOfTwo(n/2)

                    /2      /2      /2      /2      /2
                16 ----> 8 ----> 4 ----> 2 ----> 1 ----> 0
   stack will be
    [ true, base case when we get to 1 only when 2 is divided by 2  ]
    [ 2%2 is 0 == true, isPowerOfTwo(1)   ]
    [ 4%2 is 0 == true, isPowerOfTwo(2)   ]
    [ 8%2 is 0 == true, isPowerOfTwo(4)   ]
    [ 16%2 is 0 == true, isPowerOfTwo(8)   ]

    pops [ true, case when we get to one only when 2 is divided by 2  ]
    [ 2%2 is 0 == true, isPowerOfTwo(1) is true cause of line 24   ]
    [ 4%2 is 0 == true, isPowerOfTwo(2)   ]
    [ 8%2 is 0 == true, isPowerOfTwo(4)   ]
    [ 16%2 is 0 == true, isPowerOfTwo(8)   ]

    pops [ 2%2 is 0 == true, true)    ]
    [ 4%2 is 0 == true, isPowerOfTwo(2)is true cause of line 30   ]
    [ 8%2 is 0 == true, isPowerOfTwo(4)   ]
    [ 16%2 is 0 == true, isPowerOfTwo(8)   ]

    pops [ 4%2 is 0 == true, true   ]
    [ 8%2 is 0 == true, isPowerOfTwo(4) is true cause of line 35  ]
    [ 16%2 is 0 == true, isPowerOfTwo(8)   ]

    pops [ 8%2 is 0 == true, isPowerOfTwo(4)   ]
    [ 16%2 is 0 == true, isPowerOfTwo(8) is true cause of line 39  ]

    [ 16%2 is 0 == true, true  ] --> so we return true

what are my base cases?
                   /2      /2
                3 ----> 1 ----> 0
   stack will be
    [ true, base case when we get to 1 only when 2 is divided by 2  ]
    [ 3%2 is not 0 == false, isPowerOfTwo(1)   ]

    pop [ true, base case when we get to 1 only when 2 is divided by 2  ]
    [ 3%2 is not 0 == false, isPowerOfTwo(1) is true cause of line 51  ]

    [ 3%2 is not 0 == false, true  ] --> false
    /////////////////////////////////
    ////////// psudocode ////////////
    /////////////////////////////////
    base case n is 1, return true
    base case n is 0 = return false
    if n is even && reduce problem recrusevely by dividing n by 2
        return true
    return false
*/

// below code work. commented and uncommented one
func isPowerOfTwoRecrusive(_ n: Int) -> Bool {
    /*
    if n == 0 { return false }
    if n == 1 { return true}
    if n % 2 != 0 { return false }
    return isPowerOfTwoRecrusive(n/2)
     */
    
    if n == 0 { return false }
    if n == 1 { return true}
    return n % 2 == 0 && isPowerOfTwoRecrusive(n/2)
}

print(isPowerOfTwoRecrusive(1))
print(isPowerOfTwoRecrusive(16))
print(isPowerOfTwoRecrusive(3))
print(isPowerOfTwoRecrusive(10))
print(isPowerOfTwoRecrusive(-10))

func isPowerOfTwoIterative(_ n: Int) -> Bool {
    if n == 1 { return true }
    if n <= 0 { return false}
    if n % 2 != 0 { return false }

    var nCopy = n
    while nCopy > 2 {
        if nCopy % 2 == 0 {
            nCopy /= 2
        } else {
            return false
        }
    }
    return true
}

print(isPowerOfTwoIterative(1))
print(isPowerOfTwoIterative(16))
print(isPowerOfTwoIterative(3))
print(isPowerOfTwoIterative(10))
print(isPowerOfTwoIterative(-10))
