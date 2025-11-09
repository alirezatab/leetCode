/*
 
 if not / or .., then push into stack
 /.../a/../b//c/../d/./ loop throught the string and ignore /'s and ignore . i think
 
 [..., a], then we see .., so if we see .., pop from stack, but also check that if stack is empty and you do a pop is invalid
 
 [..., b, c], then we see .. -> [..., b]
 
 [..., b, d ]
 */


func simplifyPath(_ path: String) -> String {
  var path = path.split(separator: "/").map { String($0) }
  var stack = [String]()
  
  for char in path {
    if char == "." {
      continue
    } else if char == ".." {
      if !stack.isEmpty {
        stack.removeLast()
      }
    } else {
      stack.append(char)
    }
  }
  
  var result = ""
  if stack.isEmpty {
    return "/"
  }
  
  // while !stack.isEmpty {
  //     result = "/\(stack.removeLast())" + result
  // }
  
  return "/\(stack.joined(separator: "/"))" //result
}

print(simplifyPath("/home/"))
print(simplifyPath("/home//foo/"))
print(simplifyPath("/home/user/Documents/../Pictures"))
print(simplifyPath("/../"))
print(simplifyPath("/.../a/../b/c/../d/./"))

