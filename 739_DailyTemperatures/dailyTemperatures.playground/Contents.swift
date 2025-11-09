/*      i
 [73,74,75,71,69,72,76,73]
 
 temp keeper = [0, ] 74 > top of the stack --> 74 > temperatures[0] --> 74 > 73, if true
 index i - index at top of the stack = how many days apart --> 1 - 0 == 1, do add 1 to zero
 then popLast --> TK = [] -> add index for 74 --> [1]
 
 i
 [73,74,75,71,69,72,76,73]
 
 visualazatio of stack = [74]
 stackOfIndex = [1]                      i
 res = [1,1,0,0,0,0,0,0]] 75 > 74 -> 2 - 1 = 2 -> 1 inside index at i --> 1
 visualazatio of stack = [75]
 stackOfIndex = [2]
 
 i
 [73,74,75,71,69,72,76,73]
 
 res = [1,1,0,0,0,0,0,0]] 71 < 75 so just add the index to stack
 visualazatio of stack = [75, 71]
 stackOfIndex = [2, 3]
 
 i
 [73,74,75,71,69,72,76,73]
 
 res = [1,1,0,0,0,0,0,0]] 69 < 71 so just add the index to stack
 visualazatio of stack = [75, 71, 69]
 stackOfIndex = [2, 3, 4]
 
 i
 [73,74,75,71,69,72,76,73]
 so a while loop
 0 1 2 3 4
 72 > 69 --> 5-4 == 1--> res = [1,1,0,0,1,0,0,0]] -> we pop last element
 visualazatio of stack = [75, 71]
 stackOfIndex = [2, 3]
 
 0 1 2 3 4
 72 > 71 --> 5-3 == 2--> res = [1,1,0,2,1,0,0,0]] -> we pop last element
 visualazatio of stack = [75]
 stackOfIndex = [2]
 
 72 is not > 75 --> then add to stack
 visualazatio of stack = [75, 72]
 stackOfIndex = [2, 5]
 
 i
 [73,74,75,71,69,72,76,73]
 so a while loop
 0 1 2 3 4 5
 76 > 72 --> 6-5 == 1--> res = [1,1,0,2,1,1,0,0] -> we pop last element
 visualazatio of stack = [75]
 stackOfIndex = [2]
 
 0 1 2 3 4 5
 76 > 75 --> 6-2 == 4--> res = [1,1,4,2,1,1,0,0] -> we pop last element
 visualazatio of stack = []
 stackOfIndex = []
 visualazatio of stack = [76]
 stackOfIndex = [6]
 
 0 1 2 3 4 5
 73 is not > 76 -->add to stack
 visualazatio of stack = [76, 73]
 stackOfIndex = [6, 7]
 */

// Time: o(n)
// Space: o(n)

// This can

func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
  var res = Array(repeating: 0, count: temperatures.count)
  var monotonicDecreasingStack = [0] // deacreasing means [76, 74, 73] and top < next item
  // indeasitng [74, 75, 76] --> top > next
  
  for i in 1..<temperatures.count {
    while let lastTempIndex = monotonicDecreasingStack.last,
          temperatures[i] > temperatures[lastTempIndex] {
      
      let differenceInDays = i - lastTempIndex
      res[lastTempIndex] = differenceInDays
      monotonicDecreasingStack.popLast()
    }
    
    monotonicDecreasingStack.append(i)
  }
  
  
  return res
}

print(dailyTemperatures([73,74,75,71,69,72,76,73]))
print(dailyTemperatures([30,40,50,60]))
print(dailyTemperatures([30,60,90]))

// same as what i had done but a bit different. I like mine better since its nore swifty but wordy
func dailyTemperaturesFromLeetcodeClass(_ temperatures: [Int]) -> [Int] {
  var res = Array(repeating: 0, count: temperatures.count)
  var monotonicDecreasingStack = [Int]()
  
  for i in 0..<temperatures.count {
    while let lastTempIndex = monotonicDecreasingStack.last, temperatures[lastTempIndex] < temperatures[i] {
      let j = monotonicDecreasingStack.popLast()!
      res[j] = i - j
    }
    
    monotonicDecreasingStack.append(i)
  }
  
  return res
}


