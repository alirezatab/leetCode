// this is an adjanceny list
// vertices are rooms, keys are edges

// [[1],[2],[3],[]]

/*
    var seen = Set<Int>

dfs(0)
    dfs(vertix)
        seen.insert(vertic) --> seen = {0}
        for key in rooms[0] {  -> [1]
            if key is not in seen {
                dfs(key)
            }
    }

dfs(1)
    dfs(vertix)
        seen.insert(vertic) --> seen = {0, 1}
        for key in rooms[1] {  -> [2]
            if key is not in seen {
                dfs(key)
            }
    }

dfs(2)
    dfs(vertix)
        seen.insert(vertic) --> seen = {0, 1, 2}
        for key in rooms[2] {  -> [3]
            if key is not in seen {
                dfs(key)
            }
    }

dfs(3)
    dfs(vertix)
        seen.insert(vertic) --> seen = {0, 1, 2, 3}
        for key in rooms[3] {  -> []
            if key is not in seen {
                dfs(key)
            }
    }

    rerturn seen.count == rooms.coount

[[1,3],[3,0,1],[2],[0]]
 seen = {0} -> [1,3], go to room 1
seen = {0, 1} -> [3, 0, 1], go to room 3
seen = {0, 1, 3} -> [3, 0, 1], go to room 0, 0 in seen so ski, 1 is in seen so skio

pop back do fs(1)
seen = {0, 1, 3} -> [1,3], go to room 3

seen.count != roomscount so false
*/
// Time: o(V + E) at worse, we visit all the rooms starting from zero
// You visit each room once (thanks to the seen set), and for each room, you iterate through all its keys. So overall, you process every vertex and every edge exactly once → O(V + E).

// Space: o(V)
// stack will o(n) deep when we visit all the rooms
func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
  var seen = Set<Int>()
  func dfs(_ room: Int) {
    seen.insert(room)
    for key in rooms[room] {
      if !seen.contains(key) {
        dfs(key)
      }
    }
  }
  
  dfs(0)
  return seen.count == rooms.count
}

print(canVisitAllRooms([[1],[2],[3],[]]))
print(canVisitAllRooms([[1,3],[3,0,1],[2],[0]]))
