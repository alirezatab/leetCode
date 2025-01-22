import UIKit

/*
    // uses dictionary to get frequencies -> k == Char, V == occurances
    // uses dictionary to get frequencyToCharacters --> k == occurances, V == [char]
    // then builds the final result string

    // Time: o(n) or o(n + u)
    // space: o(n)
    func frequencySort(_ s: String) -> String {
        let frequencies = s.reduce(into: [Character: Int]()) { counts, char in
            counts[char, default: 0] += 1
        }
        //print(frequencies)

        let frequencyToCharacters = frequencies.reduce(into: [Int: [Character]]()) { dict, pair in
            let (char, freq) = pair
            dict[freq, default: []].append(char)
        }
        print(frequencyToCharacters)

        var resultComponents = [String]()
        for i in stride(from: s.count, to: 0, by: -1) {
            if let chars = frequencyToCharacters[i] {
                for char in chars {
                    resultComponents.append(String(repeating: char, count: i))
                }
            }
        }

        return resultComponents.joined()
    }
    */

    // Time: o(n log n) or o(n + u log u)
    // space: o(n)
    func frequencySort(_ s: String) -> String {
        // Count the occurrences of each character
        let frequencies = s.reduce(into: [Character: Int]()) { counts, char in
            counts[char, default: 0] += 1
        }
        // Make a list of the keys, sorted by frequency
        let characters = frequencies.keys.sorted { return frequencies[$0]! > frequencies[$1]! }

        // Build the result string
        // var resultComponents = [String]()
        // for char in characters {
        //     if let copies = frequencies[char] {
        //         resultComponents.append(String(repeating: char, count: copies))
        //     }
        // }

        // return resultComponents.joined()

        return characters.compactMap {
            guard let count = frequencies[$0] else { return nil }
            return String(repeating: $0, count: count)
        }.joined()
    }

print(frequencySort("tree"))
print(frequencySort("cccaaa"))
print(frequencySort("Aabb"))
