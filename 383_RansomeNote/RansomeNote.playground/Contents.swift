import Foundation

/*
{a: 2}
{a: 2, b: 1}
*/



// Time: o(m)
// Space: o(k) --> where k can not be more than 26 so o(1)
/*
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
*/


// one dict
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


/*
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
*/
