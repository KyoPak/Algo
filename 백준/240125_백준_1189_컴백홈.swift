// 240125_백준_1189_컴백홈
let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let r = input[0]    // 세로
let c = input[1]    // 가로
let k = input[2]    // 타겟거리

var board: [[String]] = []
for _ in 0..<r {
    let line = readLine()!.map { String($0) }
    board.append(line)
}

// 시작점은 왼쪽 아래
var start: (Int, Int) = (r - 1, 0)
var target: (Int, Int) = (0, c - 1)
var answer = 0

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: c), count: r)
visited[start.0][start.1] = true

dfs(y: start.0, x: start.1, dist: 1)
print(answer)

func dfs(y: Int, x: Int, dist: Int) {
    if dist > k { return }
    
    if y == target.0 && x == target.1 {
        if dist == k { answer += 1 }
        
        return
    }
    
    for dir in 0..<4 {
        let ny = y + dy[dir]
        let nx = x + dx[dir]
        
        if ny < 0 || nx < 0 || ny >= r || nx >= c { continue }
        if board[ny][nx] == "T" { continue }
        if visited[ny][nx] { continue }
        
        visited[ny][nx] = true
        dfs(y: ny, x: nx, dist: dist + 1)
        visited[ny][nx] = false
    }
}
