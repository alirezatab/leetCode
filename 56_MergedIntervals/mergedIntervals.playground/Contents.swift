import UIKit

/*
    brute force
    go though each elemet, compare it with ever other one and merge if intercept. n^2 time

    
    if sorted. --> sort based on start time

intervals = [[1,3],[2,6],[8,10],[15,18]]
output: [[1,6],[8,10],[15,18]]

so sort it based on first value, since there is no guarantee that they values look like the input examples.
after sorting, it will look like above.

var result = [Int]()
then go through each element
      *
    [1,3],[2,6],[8,10],[15,18]] --> if result is empty, so add [1,3] --> satisfy if only 1 element
                                --> res = [1,3]

            *
    [1,3],[2,6],[8,10],[15,18]] --> else if get last element from res --> [1,3]
                                --> and check lastInterval[1] < interval[0]
                                        append interval --> res = [[1,3]]

            *
    [1,3],[2,6],[8,10],[15,18]] --> else !isEmpty, get last element from res --> [1,3]
                                --> and update the
                                        lastInterval[end][1] = max(lastInterval[end][1], interval[1])
                                        update results with updated / merged interval
                                        --> results[end] = lastInterval
                                    res = [1,6]

                  *
    [1,3],[2,6],[8,10],[15,18]] --> else if get last element from res --> [1,6]
                                --> and check lastInterval[1] < interval[0]
                                                    6         <     8
                                        append interval --> res = [[1,6], [8,10]]
    
                          *
    [1,3],[2,6],[8,10],[15,18]] --> else if get last element from res --> res = [[1,6], [8,10]]
                                --> and check lastInterval[1] < interval[0]
                                        append interval --> res = [[1,6], [8,10], [15,18]]
*/

// Big O
// Time: o(N logN) for sorting + n to go through all elements to find the result
//    so o(N logN) + n = o(N logN)
// Space: o(n) in swift cause we had to sort into another array. could be o(1) if inout was used to pass the interval as pass by reference instead of pass by value which is also let and not var.

func merge(_ intervals: [[Int]]) -> [[Int]] {
    var sortedInterval = intervals.sorted { $0[0] <= $1[0] }
    var results = [[Int]]()
    for interval in sortedInterval {
        if results.isEmpty {
            results.append(interval)
        } else if let lastInterval = results.last, lastInterval[1] < interval[0] {
            results.append(interval)
        } else if var lastInterval = results.last {
            lastInterval[1] = max(lastInterval[1], interval[1])
            results[results.count - 1] = lastInterval
        }
    }
    return results
}

print(merge([[1,3],[2,6],[8,10],[15,18]]))
print(merge([[1,4],[4,5]]))
