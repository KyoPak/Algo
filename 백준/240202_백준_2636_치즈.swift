// 240202_백준_2636_치즈

// 치즈는 공기와 닿아있으면 녹는다.
// 치즈로 둘러쌓여있고 내부에 구멍이있으면 안녹는다.
// 치즈가 없어지는 시간.

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]    // 세로
let m = input[1]    // 가로

var board: [[Int]] = []
var queue: [(Int, Int)] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)

for sero in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
    
    for garo in 0..<m {
        if sero == 0 || sero == n - 1 {
            queue.append((sero, garo))
            visited[sero][garo] = true
        }
        if garo == 0 || garo == m - 1 {
            queue.append((sero, garo))
            visited[sero][garo] = true
        }
    }
}

var time = 0
var cheeseSize = 0
while true {
    var cheese: [(Int, Int)] = []
    var index = 0
    
    while index < queue.count {
        let cur = queue[index]
        index += 1
        
        for dir in 0..<4 {
            let ny = cur.0 + dy[dir]
            let nx = cur.1 + dx[dir]
            
            if ny < 0 || nx < 0 || ny >= n || nx >= m { continue }
            if visited[ny][nx] { continue }
            
            visited[ny][nx] =  true
            if board[ny][nx] == 1 {
                cheese.append((ny, nx))
                board[ny][nx] = 0
            } else {
                queue.append((ny, nx))
            }
        }
    }
    
    if cheese.isEmpty { break }
    time += 1
    queue = cheese
    cheeseSize = cheese.count
}

print(time)
print(cheeseSize)
