import UIKit

func checkIfPangram(_ sentence: String) -> Bool {
    Set(sentence).count == 26
}

print(checkIfPangram("thequickbrownfoxjumpsoverthelazydog"))
print(checkIfPangram("leetcode"))
