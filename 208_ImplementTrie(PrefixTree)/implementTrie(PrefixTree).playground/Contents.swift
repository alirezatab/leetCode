import UIKit


class TriNode {
    var children = [Character: TriNode]()
    var isEndOfWord = false
}

class Trie {

    private let root: TriNode

    init() {
        root = TriNode()
    }
    
    func insert(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TriNode()
            }
            node = node.children[char]!
        }
        node.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        guard let node = findNode(word) else { return false }
        return node.isEndOfWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        return findNode(prefix) != nil
    }

    private func findNode(_ word: String) -> TriNode? {
        var node = root
        for char in word {
            guard let nextNode = node.children[char] else { return nil }
            node = nextNode
        }
        return node
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
