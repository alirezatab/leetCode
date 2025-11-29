/*   * *
    [7,1,5,3,6,4] maxProfit = 0
    7 > 1 continue
       * *
    [7,1,5,3,6,4] maxProfit = 0
    1 < 5 sell... maxProfit = 4

         * *
    [7,1,5,3,6,4] maxProfit = 4
    5 > 3 continue

           * *
    [7,1,5,3,6,4] maxProfit = 4
    3 < 6 sell... maxProfit = 4 + 6 - 3 = 7

             * *
    [7,1,5,3,6,4] maxProfit = 7
    6 > 6 continue

    for i in 1..<count {
        if val@ i - 1 >= val at j
            continue
        else
            maxProfit += arr[i] - arr[i-1]
    }
     
*/

// Time: o(n)
// Space:o(1)

func maxProfit(_ prices: [Int]) -> Int {
  var profit = 0
  for i in 1..<prices.count {
    if prices[i-1] < prices[i] {
      profit += prices[i] - prices[i-1]
    }
  }
  return profit
}

print(maxProfit([7,1,5,3,6,4]))
print(maxProfit([1,2,3,4,5]))
print(maxProfit([7,6,4,3,1]))
