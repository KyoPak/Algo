// 시간초과 : C++로는 시간초과안남..

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let r = input[0]
let c = input[1]

var board: [[String]] = []

for _ in 0..<r {
    let input = readLine()!.map { String($0) }
    board.append(input)
}

var dict: [String: Bool] = [:]
for alpha in "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map({ String($0) }) {
    dict[alpha] = false
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: c), count: r)

var answer = 0
dfs(y:0, x:0, count: 1)
print(answer)

func dfs(y: Int, x: Int, count: Int) {
    answer = max(answer, count)
    
    for dir in 0..<4 {
        let ny = y + dy[dir]
        let nx = x + dx[dir]
        
        if ny < 0 || nx < 0 || ny >= r || nx >= c { continue }
        if (dict[board[ny][nx]]!) { continue }
        
        dict[board[ny][nx]] = true
        dfs(y: ny, x: nx, count: count + 1)
        dict[board[ny][nx]] = false
    }
}
