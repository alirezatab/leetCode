
func isValid1(_ s: String) -> Bool {
  var closeOpenMap: [Character: Character] = ["(" : ")", "{" : "}", "[" : "]"]
  var stack = [Character]()
  for char in s {
    if (char == ")" || char == "}" || char == "]") && stack.isEmpty {
      return false
    } else if char == "(" || char == "{" || char == "[" {
      stack.append(char)
    } else {
      let lastOpeningChar = stack.removeLast()
      guard let lastClosingChar = closeOpenMap[lastOpeningChar], lastClosingChar == char else {
        return false
      }
    }
  }
  
  return stack.isEmpty
}

func isValidDoneLikeLeetCodeCourse(_ s: String) -> Bool {
  var closeOpenMap: [Character: Character] = ["(" : ")", "{" : "}", "[" : "]"]
  var stack = [Character]()
  
  for char in s {
    if let openingBracket = closeOpenMap[char] {
      stack.append(char)
    } else {
      guard !stack.isEmpty else { return false }
      
      let lastOpening = stack.removeLast()
      if closeOpenMap[lastOpening] != char {
        return false
      }
    }
  }
  
  return stack.isEmpty
}

enum Brackets: Character {
  case openSquare = "["
  case closeSquare = "]"
  case openParent = "("
  case closeParent = ")"
  case openBracket = "{"
  case closeBracket = "}"
}


func isValidUsingEnums(_ s: String) -> Bool {
  guard s.count != 0 else {return true}
  
  var stack = [Character]()
  
  for char in s {
    // better to use enums
    if stack.isEmpty && (char == Brackets.closeBracket.rawValue ||
                         char == Brackets.closeSquare.rawValue ||
                         char == Brackets.closeParent.rawValue) {
      return false
    }
    
    if char == Brackets.openBracket.rawValue ||
        char == Brackets.openSquare.rawValue ||
        char == Brackets.openParent.rawValue {
      
      stack.append(char)
    } else if stack.last == Brackets.openBracket.rawValue &&
                char == Brackets.closeBracket.rawValue {
      stack.removeLast()
    } else if stack.last == Brackets.openParent.rawValue &&
                char == Brackets.closeParent.rawValue {
      stack.removeLast()
    } else if stack.last == Brackets.openSquare.rawValue &&
                char == Brackets.closeSquare.rawValue {
      stack.removeLast()
    } else {
      return false
    }
  }
  return stack.count == 0 ? true : false
}

