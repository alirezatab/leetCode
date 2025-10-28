/*
{a: 2}
{a: 2, b: 1}

{a:2}

for ransomeNoteDict, key and value    ------ a -> {a: 2, b: 1}
    if key exists insode magazine, and the value of ransom not > magazine key {
        return false
    }


*/



// Time: o(m)
// Space: o(k) --> where k can not be more than 26 so o(1)
/*
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        guard ransomNote.count <= magazine.count else { return false }


        var magDict = [Character: Int]()
        var ransomDict = [Character: Int]()
        for char in magazine {
            magDict[char, default: 0] += 1
        }
        
        for char in ransomNote {
            ransomDict[char, default: 0] += 1
        }

        for (char, val) in magDict {
            if let v = ransomDict[char], v <= val {
                ransomDict[char] = nil
            }
        }

        return ransomDict.isEmpty
    }
}
*/

// one dict but simpler
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        guard ransomNote.count <= magazine.count else { return false }
    
        var ransomDic = [Character: Int]()
        for char in ransomNote {
            ransomDic[char, default: 0] += 1
        }
        
        for char in magazine {
            guard let value = ransomDic[char] else { continue }
            ransomDic[char] = value - 1 == 0 ? nil : value - 1
        }
        
        return ransomDic.isEmpty
    }
}



// one dict
/*
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        guard ransomNote.count <= magazine.count else { return false }

        var magDict = [Character: Int]()
        for char in magazine {
            magDict[char, default: 0] += 1
        }

        for char in ransomNote {
            if let val = magDict[char], val > 0 {
                magDict[char] = val - 1
            } else {
                return false
            }
        }

        return true
    }
}
*/


/*
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var magazineCopy = magazine

        for letter in ransomNote {
            if let index = magazineCopy.firstIndex(of: letter) {
                magazineCopy.remove(at: index)
            } else {
                return false
            }
        }

        return true
    }
}
*/
