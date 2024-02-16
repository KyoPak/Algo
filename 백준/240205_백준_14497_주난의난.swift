// 240205_백준_14497_주난의난

// INPUT
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]

let location = readLine()!.split(separator: " ").map { Int(String($0))! }
var start = (location[0] - 1, location[1] - 1)
var target = (location[2] - 1, location[3] - 1)

var board: [[String]] = []
for _ in 0..<n {
    let line = readLine()!.map { String($0) }
    board.append(line)
}

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

var queue: [(Int, Int)] = [(start.0, start.1)]
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
visited[start.0][start.1] = true
var count = 0
while true {
    if board[target.0][target.1] == "0" { break }
    
    var tempQueue: [(Int, Int)] = []
    var index = 0
    count += 1
    
    while index < queue.count {
        let cur = queue[index]
        index += 1
        
        for dir in 0..<4 {
            let ny = cur.0 + dy[dir]
            let nx = cur.1 + dx[dir]
            
            if ny < 0 || nx < 0 || ny >= n || nx >= m { continue }
            if visited[ny][nx] != false { continue }
            
            visited[ny][nx] = true
            if board[ny][nx] != "0" {
                board[ny][nx] = "0"
                tempQueue.append((ny, nx))
            } else {
                queue.append((ny, nx))
            }
        }
    }
    
    queue = tempQueue
}

print(count)
