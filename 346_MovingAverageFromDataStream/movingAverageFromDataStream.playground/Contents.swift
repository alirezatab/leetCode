
class MovingAverage {
    var size: Int
    var queue: [Int]
    var sum: Int
    
    init(_ size: Int) {
        self.size = size
        queue = []
        sum = 0
    }
    
    func next(_ val: Int) -> Double {
        if queue.count == size {
            sum -= queue.removeFirst()
        }
        
        queue.append(val)
        sum += val
        
        return Double(sum) / Double(queue.count)
    }
}


// this was a chatGpt suggestion to show a different way when your coding language does not have queue....
// one can use ring buffer and the modules to get the sums
// however, the array will keep growing for large data sets, cause the items are never remvoed from the array
class MovingAverageChatGPT {
    private let size: Int
    private var buffer: [Int]
    private var index = 0
    private var count = 0
    private var sum = 0
    
    init(_ size: Int) {
        self.size = size
        self.buffer = Array(repeating: 0, count: size)
    }
    
    func next(_ val: Int) -> Double {
        // If full, subtract the value being overwritten
        if count == size {
            sum -= buffer[index]
        } else {
            count += 1
        }
        
        buffer[index] = val
        sum += val
        

        index = (index + 1) % size
        print(index)
        
        return Double(sum) / Double(count)
    }
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */
