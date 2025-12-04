/*   * i
    [7,1,5,3,6,4] minBuy = 7, prices[i] = 1.. 1<minBut so update minBuy

       * i
    [7,1,5,3,6,4] else --> 5-1 =4 --> max Profit = 4

       *   i
    [7,1,5,3,6,4] else --> 3-1 =3 --> max Profit  = 4

       * i
    [7,1,5,3,6,4] else --> 5-1 =4 --> max Profit = 4

       *     i
    [7,1,5,3,6,4] else --> 6-1 = 5 --> max Profit  = 5

       *       i
    [7,1,5,3,6,4] else --> 4-1 = 3 --> max Profit  = 5
*/

func maxProfit(_ prices: [Int]) -> Int {
  var minBuy = prices[0]
  var maxProfit = 0
  
  for i in 1..<prices.count {
    if prices[i] < minBuy {
      minBuy = prices[i]
    } else {
      maxProfit = max(maxProfit, prices[i] - minBuy)
    }
  }
  
  return maxProfit
}

print(maxProfit([7,1,5,3,6,4]))
print(maxProfit([7,6,4,3,1]))
