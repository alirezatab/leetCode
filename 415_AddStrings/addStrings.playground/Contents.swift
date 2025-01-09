import UIKit

func addStrings(_ a: String, _ b: String) -> String {
  var aPtr = a.count - 1
  var bPtr = b.count - 1
  var carryOver = 0
  var result = ""
  
  while aPtr > -1 || bPtr > -1 || carryOver > 0 {
    let digitA = aPtr >= 0 ? a[a.index(a.startIndex, offsetBy: aPtr)].wholeNumberValue ?? 0 : 0
    let digitB = bPtr >= 0 ? b[b.index(b.startIndex, offsetBy: bPtr)].wholeNumberValue ?? 0 : 0
    
    let sum = digitA + digitB + carryOver
    carryOver = sum / 10
    result.insert(Character("\(sum % 10)"), at: result.startIndex)
    
    aPtr -= 1
    bPtr -= 1
  }
  
  
  return result
}

print(addStrings("456", "77"))

func addStringsUsingSplitStringHandlesDecemials(_ a: String, _ b: String) -> String {
    // Splitting the inputs into integer and fractional parts
    let partsA = a.split(separator: ".").map { String($0) }
    let partsB = b.split(separator: ".").map { String($0) }
//    print(partsA)
//    print(partsB)
    let intPartA = partsA[0]
    let intPartB = partsB[0]
    
    let fracPartA = partsA.count > 1 ? partsA[1] : ""
    let fracPartB = partsB.count > 1 ? partsB[1] : ""
    
    // Normalize fractional parts by padding with zeros
    let maxLength = max(fracPartA.count, fracPartB.count)
    let normalizedFracPartA = fracPartA.padding(toLength: maxLength, withPad: "0", startingAt: 0)
    let normalizedFracPartB = fracPartB.padding(toLength: maxLength, withPad: "0", startingAt: 0)
//    print(normalizedFracPartA)
//    print(normalizedFracPartB)
    
    // Add integer parts and fractional parts separately
    let (addedFracPart, carryFromFrac) = addParts(normalizedFracPartA, normalizedFracPartB)
    let (addedIntPart, _) = addParts(intPartA, intPartB)
    let (addedCarryFinally, _ ) = addParts(addedIntPart, carryFromFrac)
    
    
    // Combine the results
    let result = addedFracPart == "0" ? addedIntPart : "\(addedCarryFinally).\(addedFracPart)"
//    print(result)
    return result
}


// Time: o(max(m or n)), m being a.count and n being n.
// Space: o(max(m or n)), m being a.count and n being n.count
func addParts(_ a: String, _ b: String) -> (String, String) {
    var a = Array(a)
    var b = Array(b)

    var digitMap = [String: Int]()
    for num in 0...9 {
        digitMap["\(num)"] = num
    }

    var aPtr = a.count - 1
    var bPtr = b.count - 1
    var carry = 0
    var result = [Int]()

    while aPtr >= 0 || bPtr >= 0 {
        var aNum = 0
        var bNum = 0
        if aPtr >= 0, let num = digitMap["\(a[aPtr])"] {
            aNum = num
        }
        if bPtr >= 0, let num = digitMap["\(b[bPtr])"] {
            bNum = num
        }

        let sum = aNum + bNum + carry
        
        carry = sum / 10
        let value = sum % 10

        result.append(value)
        aPtr -= 1
        bPtr -= 1
    }
    
    return (result.reversed().map { "\($0)"}.joined(separator: ""), "\(carry)")
}
