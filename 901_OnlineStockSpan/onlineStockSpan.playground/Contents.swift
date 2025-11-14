// Time: o(1) --> Even though there is a while loop in next, that while loop can only run n times total across the entire algorithm. Each element can only be popped off the stack once, and there are up to n elements.

//This is called amortized analysis - if you average out the time it takes for next to run across n calls, it works out to be O(1). If one call to next takes a long time because the while loop runs many times, then the other calls to next won't take as long because their while loops can't run as long.


// Space: o(n)
// In the worst case scenario for space (when all the stock prices are decreasing), the while loop will never run, which means the stack grows to a size of n.

/*
    (starting from that day and going backward) --> hint at using a stack probably
    stock price <= price of that day? which day
    so if stick price is 8$ today, span = previousDays <= 8

    so in inti, initilize the stack
    stack -- append and popLast-> s = []

    100 -> [100], return 1.. if stack is empty, add it to stack and return 1
    80 -> [100, 80], return 1.. if top of the stack is greater than cur price...
                        100 > 80, return 1
    60 -> [100, 80, 60], 80 > 60 return 1..
    70 -> [100, 80, 60], 70 <= 60 pop 60, and add 1 + 1 = 2, so return 2
            1 is the previous number of days... how to track that?
            * push a tuple, (price, span)
            * index or index + 1 --> cant go with index only, since we nned the price also
    [100:1, 80:1, 60:1] --> 70 --> pop tha stack, and add 70

    [100,80, 70] --> 70 --> pop tha stack, and add 70,
           return { lastSpan + currentSpan } == 1 + 1 = 2

    [100: 1,80:1, 70:2, 60:1] 60 <= 75 so we pop 1 + 1 = 2
    [100: 1,80:1, 70:2] 70 <= 75 so we pop 2 + 2 = 4
    [100: 1,80:1] 80 > 75, so we append 75
     

    [100: 1,80:1, 75:4] 80 > 75, return spane

    so cause of how we do it this is a monitobic stack, non-increasing

    func next
    var span = 1
    while stack is not empty && price at top of the stack <= price
        span += lastStocksSpan
        pop top of the stack
    
    add it to the top of the stack, the number of days
    return result
*/

// Time: o(n)
// Space: o(n)
class StockSpanner {

    var stocks: [(price: Int, span: Int)] // Stack


    init() {
        stocks = [ ]
    }
    
    func next(_ price: Int) -> Int {
        var span = 1
        while let lastStock = stocks.last, lastStock.price <= price {
            span += lastStock.span
            stocks.popLast()
        }

        stocks.append((price: price, span: span))
        return span
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */
