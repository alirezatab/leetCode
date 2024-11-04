import Foundation
/*
    Basically you can use min heap. first build the heap
 [3,2,1,5,6,4]
    3 heapSize == 1
 
    3 heapSize == 2
   /
  2
 
 3 heapSize == 3
/ \
2  1 if heapSize is more than k, start poping [3,2,1]
 
 1 heapSize == 3
/ \
2  3  [1,2,3] so no we can pop last item after we switched
 
 1 heapSize == 2
/
2    [1,2] after poping, we check if minHeap is valid, if valid, go for next number
 
 
 1 heapSize == 3
/ \
2  5   [1,2,5]
 
 5 heapSize == 3
/ \
2  1   [5,2,1]
 
 5 heapSize == 2
/
2     [5,2]
 
 2 heapSize == 2
/
5     [2,5]
 
 2 heapSize == 3
/ \
5  6   [2,5,6]
 
 6 heapSize == 3
/ \
5  2   [6,5,2]
 
 6 heapSize == 2
/
5    [6,5]
 
 5 heapSize == 2
/
6    [5,6]
 
 5 heapSize == 3
/ \
6  4   [5,6,4]
 
 4 heapSize == 3
/ \
6  5   [4,6,5]
 
 5 heapSize == 3
/ \
6  4   [5,6,4]
 
 5 heapSize == 2
/
6     [5,6]
 */

// Big O Notation
// Time: o(n logk)
    /*
    Operations on a heap cost logarithmic time relative to its size. Because our heap is limited to a size of k, operations cost at most O(logk). We iterate over nums, performing one or two heap operations at each iteration.

    We iterate n times, performing up to logk work at each iteration, giving us a time complexity of O(n⋅logk).

    Because k≤n, this is an improvement on the previous approach.
    */
// Space: o(k)
    /*
    The heap uses O(k) space.
    */
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var k = k
    // var minHeap = Heap<Int>()
    var minHeap = [Int]() // assume it is a Heap
    for num in nums {
        // minHeap.insert(num)
        minHeap.insert(num, at: minHeap.count) // min Heap inserts at the end
        
        if minHeap.count > k {
            // minHeap.popMin()
            minHeap.removeFirst() //but in background, reorder of heap to make it valid min heap happens
        }
    }
    return minHeap.first! // minHeap.min!
}


//
//print(findKthLargest([3,2,1,5,6,4], 2))
//print(findKthLargest([3,2,3,1,2,4,5,5,6], 4))

/*
    let leftArr, midArr, rightArr = []
    find a pivot at random
         *
    [3,2,3,1,2,4,5,5,6], k = 4

    for loop through the array

        l    mid    right
    [2,1,2] [3,3] , [4,5,5,6] if k <= right.count --> return find(right, k)

    if k > right.count + mid.count {
        return(left, k - right.count - mid.count)
    }

    return pivot

    [4,5,5,6], k = 4, p = 5

    left mid    right 4<= 1
    [4]. [5,5]  [6] 4 > 1+2 --> correct, pass in left and 4-3 = 1

    [4], k= 1, p = 4
    l   mid. r
    [].  [4] []
    return pivot
*/

// Quick Select
    // Time: o(n) average, o(n^2) worst Case
    /*
    Each call we make to quickSelect will cost O(n) since we need to iterate over nums to create left, mid, and right. The number of times we call quickSelect is dependent on how the pivots are chosen. The worst pivots to choose are the extreme (greatest/smallest) ones because they reduce our search space by the least amount. Because we are randomly generating pivots, we may end up calling quickSelect O(n) times, leading to a time complexity of O(n
    2
    ).

    However, the algorithm mathematically almost surely has a linear runtime. For any decent size of nums, the probability of the pivots being chosen in a way that we need to call quickSelect O(n) times is so low that we can ignore it.

    On average, the size of nums will decrease by a factor of ~2 on each call. You may think: that means we call quickSelect O(logn) times, wouldn't that give us a time complexity of O(n⋅logn)? Well, each successive call to quickSelect would also be on a nums that is a factor of ~2 smaller. This recurrence can be analyzed using the master theorem with a = 1, b = 2, k = 1:

    T(n)=T(n/2) + o(n)
    */
// Space: o(n)
    /*
    We need O(n) space to create left, mid, and right. Other implementations of Quickselect can avoid creating these three in memory, but in the worst-case scenario, those implementations would still require O(n) space for the recursion call stack.
    */
func findKthLargest2(_ nums: [Int], _ k: Int) -> Int {
    let pivot = nums.randomElement()!
    var leftArr = [Int](), rightArr = [Int](), midArr = [Int]()

    for num in nums {
        if num > pivot {
            rightArr.append(num)
        } else if num < pivot {
            leftArr.append(num)
        } else {
            midArr.append(num)
        }
    }

    if k <= rightArr.count {
        return findKthLargest(rightArr, k)
    }
    if rightArr.count + midArr.count < k {
        return findKthLargest(leftArr, k - rightArr.count - midArr.count)
    }

    return pivot
}

//print(findKthLargest2([3,2,1,5,6,4], 2))
//print(findKthLargest2([3,2,3,1,2,4,5,5,6], 4))

/*
[3,2,3,1,2,4,5,5,6], k = 4
[1,2,2,1,2,1] 6-1+1 = array of size 6
           i  4-1 = 3
         i    3-2 = 1
       i      1-1 = 0 --> 3 + min whihch is 1 so we get 4, so return 4

*/
// Counting Sort
// Time: o(n + m)
// space: o(m) - size of coutnerArr
func findKthLargest3(_ nums: [Int], _ k: Int) -> Int {
    guard let min = nums.min() else { return -1 }
    guard let max = nums.max() else { return -1 }
    let count = max - min + 1
    var counterArr = [Int](repeating: 0, count: count)

    for num in nums {
        counterArr[num - min] += 1
    }

    var remain = k
    for (index, number) in counterArr.enumerated().reversed() {
        remain -= number
        if remain <= 0 {
            return index + min
        }
    }
    return -1
}

//print(findKthLargest3([3,2,1,5,6,4], 2))
//print(findKthLargest3([3,2,3,1,2,4,5,5,6], 4))
