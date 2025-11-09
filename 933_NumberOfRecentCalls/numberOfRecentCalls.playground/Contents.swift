/*
    everytime ping is called,
    we need to check if the t >= t - 3000
*/

// Time:
// Amortized time per ping call: O(1)
// ✅ Worst-case time for one call: O(n) (e.g., if you ping at t=0, then t=6000 — you remove all previous pings)


// space: o(1)
// In the worst case, if someone pings every millisecond, you could have up to 3001 elements.
// Space complexity: O(1) (at most 3001 elements)
class RecentCounter {
    private var queue: [Int]
    
    init() {
        queue = []
    }
    
    func ping(_ t: Int) -> Int {
        // queue.append(t) --> can also do this based on editorial
        while let prevPing = queue.first, prevPing < t - 3000 {
            queue.removeFirst()
        }

        queue.append(t)

        return queue.count
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */
