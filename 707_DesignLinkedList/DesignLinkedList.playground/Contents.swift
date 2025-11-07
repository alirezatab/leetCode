class MyLinkedList {
    let sentialHeadNode: ListNode?
    var size: Int

    init() {
        sentialHeadNode = ListNode(0)
        size = 0
    }
    
    func get(_ index: Int) -> Int {
        guard index >= 0, index < size else { return -1 }
        var cur = sentialHeadNode?.next
        for _ in 0..<index {
            cur = cur?.next
        }
        return cur!.val
    }
    
    func addAtHead(_ val: Int) {
        // let node = ListNode(val)
        // let nextNode = sentialHeadNode?.next
        // sentialHeadNode?.next = node
        // node.next = nextNode
        // size += 1
        self.addAtIndex(0, val)
    }
    
    func addAtTail(_ val: Int) {
        // let node = ListNode(val)
        // var tailNode = sentialHeadNode
        // while tailNode?.next != nil {
        //     tailNode = tailNode?.next
        // }

        // tailNode?.next = node

        // size += 1
        self.addAtIndex(size, val)
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        guard index >= 0, index <= size else { return }
        let node = ListNode(val)
        var prevNode = sentialHeadNode
        var curNode = sentialHeadNode?.next
        for _ in 0..<index {
            prevNode = curNode
            curNode = curNode?.next
        }
        prevNode?.next = node
        node.next = curNode

        size += 1
    }
    
    func deleteAtIndex(_ index: Int) {
        guard index >= 0, index < size else { return }
        var prevNode = sentialHeadNode
        var curNode = sentialHeadNode?.next
        for _ in 0..<index {
            prevNode = curNode
            curNode = curNode?.next
        }
        prevNode?.next =  curNode?.next

        size -= 1
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
