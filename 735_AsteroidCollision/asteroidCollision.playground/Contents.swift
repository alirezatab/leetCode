/*   i
    [3,5,-6,2,-1,4]
    
    [3]
    3 + 5 = 8 > 0
    [3,5]
    5 - 6 = -1 < 0 so pop
    [3]
    3 - 6 = -3 < 0 so pop
    [] --> [-6]
    since stack.top is not above 0 append next element
    [-6, 2]

    [-6, 2] next is -1, sp we hit continue

    [-6, 2] next is -1, sp we hit continue



    var stack
    loop through array
        while array.isnotEmptu && stak.top > 0 && stack.top + asteroids[i] <= 0
            pop
            if stack.top + asteroids[i] == 0, both get distroyed so continue on the outer loop so you dont append the negative again
        
        if stack.top > 0 && asteroids[i] < 0 && their sum > 0 {
            continue
        }

        
        append to stack

    return stack
*/

// Time:
// Space:
func asteroidCollision(_ asteroids: [Int]) -> [Int] {
  var stack = [Int]()
  
  outerLoop: for asteroid in asteroids {
    while let lastAsteroid = stack.last,
          lastAsteroid > 0 &&
            lastAsteroid + asteroid <= 0 {
      
      stack.popLast()
      
      if lastAsteroid + asteroid == 0 {
        continue outerLoop
      }
    }
    
    if let lastAsteroid = stack.last,
       asteroid < 0 && lastAsteroid + asteroid > 0 {
      
      continue
    }
    
    stack.append(asteroid)
  }
  
  return stack
}
