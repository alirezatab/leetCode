// Time: o(1) --> Even though there is a while loop in next, that while loop can only run n times total across the entire algorithm. Each element can only be popped off the stack once, and there are up to n elements.

//This is called amortized analysis - if you average out the time it takes for next to run across n calls, it works out to be O(1). If one call to next takes a long time because the while loop runs many times, then the other calls to next won't take as long because their while loops can't run as long.


// Space: o(n)
// In the worst case scenario for space (when all the stock prices are decreasing), the while loop will never run, which means the stack grows to a size of n.

class StockSpanner {

    var stack: [(price: Int, count: Int)]

    init() {
        stack = [ ]
    }
    
    func next(_ price: Int) -> Int {
        var count = 1
        while let lastStock = stack.last, lastStock.price <= price {
            count += lastStock.count
            stack.popLast()
        }
        stack.append((price: price, count: count))

        return count
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */
