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

function isPowerOfTwoRecrusive(n) {
    if (n == 0) { return false }
    if (n == 1) { return true }
    return (n % 2 == 0 && isPowerOfTwo(n/2))
}

console.log(isPowerOfTwoRecrusive(1));
console.log(isPowerOfTwoRecrusive(16))
console.log(isPowerOfTwoRecrusive(3))
console.log(isPowerOfTwoRecrusive(10))
console.log(isPowerOfTwoRecrusive(-10))

const isPowerOfTwoIterative = (n) => {
    if (n <= 0) return false
    if (n == 1) return true
    if (n % 2 != 0) return false

    while (n > 2) {
        if (n % 2 == 0) n /= 2
        else return false
    }

    return true 
}

console.log(isPowerOfTwoIterative(1));
console.log(isPowerOfTwoIterative(16))
console.log(isPowerOfTwoIterative(3))
console.log(isPowerOfTwoIterative(10))
console.log(isPowerOfTwoIterative(-10))
