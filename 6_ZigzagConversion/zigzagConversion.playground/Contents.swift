/*
        [P,A,Y,P,A,L,I,S,H,I,R,I,N,G], row... count == size array
        
        row is 3, count = 14
        [
            []
            []
            []
        ]
        i< 14, when zero,
        
         i,
        [P,A,Y,P,A,L,I,S,H,I,R,I,N,G]
        
        let direction = [1, -1]
        var row = 0
        var col = 0

        while i < s.count {
            while row < numROws {
                row += direction[0]
                gird[row].append(s[i])
                i += 1
            }

            while row > 0 {
                row += direction[1]
                gird[row].append(s[i])
                i += 1
            }
        }

        [
            [p]
            []
            []
        ]
           i,
        [P,A,Y,P,A,L,I,S,H,I,R,I,N,G]

        [
            [p,]
            [A,]
            [Y,]
        ]
           i,
        [P,A,Y,P,A,L,I,S,H,I,R,I,N,G]

        [
            [p,]
            [A,]
            [y,]
        ]
               i,
        [P,A,Y,P,A,L,I,S,H,I,R,I,N,G]
*/

/*
var rows = Array(repeating: "", count: numRows)
var row = 0
var direction = 1 // 1 = down, -1 = up

for char in s {
    rows[row] += char
    row += direction
    
    // Flip direction ONLY at top (row=0) or bottom (row=numRows-1)
    if row == 0 || row == numRows - 1 {
        direction *= -1
    }
}
*/

// Time: o(n)
// Space: o(n)
// below is simpler way than my way...
func convert(_ s: String, _ numRows: Int) -> String {
  guard numRows != 1 else { return s }
  guard numRows < s.count else { return s }
  
  var grid = Array(repeating: [String](), count: numRows)
  
  var row = 0
  var direction = 1
  
  for char in s {
    // Move down
    grid[row].append(String(char))
    row += direction
    
    if row == 0 || row == numRows - 1 {
      direction = -direction
    }
  }
  
  return grid.flatMap { $0 }.joined()
}

print(convert("PAYPALISHIRING", 3))
print(convert("PAYPALISHIRING", 4))
print(convert("A", 1))

func convertMyWay(_ s: String, _ numRows: Int) -> String {
  guard numRows != 1 else { return s }
  guard numRows < s.count else { return s }
  
  var grid = Array(repeating: [String](), count: numRows)
  let directions = [1, -1]
  var row = 0
  var i = 0
  var sArr = Array(s)
  
  while i < s.count {
    // Move down
    while row < numRows - 1 && i < s.count {
      grid[row].append(String(sArr[i]))
      row += directions[0]
      i += 1
    }
    
    // Move up
    while row > 0 && i < s.count {
      grid[row].append(String(sArr[i]))
      row += directions[1]
      i += 1
    }
  }
  
  return grid.flatMap { $0 }.joined()
}

print(convertMyWay("PAYPALISHIRING", 3))
print(convertMyWay("PAYPALISHIRING", 4))
print(convertMyWay("A", 1))

func convertMyWay2(_ s: String, _ numRows: Int) -> String {
  guard numRows != 1 else { return s }
  
  var grid = Array(repeating: "", count: numRows)
  let directions = [1, -1]
  var row = 0
  var i = 0
  var sArr = Array(s)
  
  while i < s.count {
    // Move down
    while row < numRows - 1 && i < s.count {
      grid[row].append(String(sArr[i]))
      row += directions[0]
      i += 1
    }
    
    // Move up
    while row > 0 && i < s.count {
      grid[row].append(String(sArr[i]))
      row += directions[1]
      i += 1
    }
  }
  
  return grid.joined()
}

print(convertMyWay2("PAYPALISHIRING", 3))
print(convertMyWay2("PAYPALISHIRING", 4))
print(convertMyWay2("A", 1))
