// 240131_백준_11559_뿌요뿌요

// 상하좌우 4개이상 -> 1연쇄 터지고, 밑으로 내려온다.

var board: [[String]] = []

for _ in 0..<12 {
    let line = readLine()!.map { String($0) }
    board.append(line)
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

var bombCount = 0

while true {
    var bombFlag = false
    var visited: [[Bool]] = Array(
        repeating: Array(repeating: false, count: 6),
        count: 12
    )
    
    for sero in 0..<12 {
        for garo in 0..<6 {
            if board[sero][garo] == "." { continue }
            if board[sero][garo] == "@" { continue }
            
            var bombQueue: [(Int, Int)] = [(sero, garo)]
            visited[sero][garo] = true
            var index = 0
            
            while index < bombQueue.count {
                let cur = bombQueue[index]
                index += 1
                
                for dir in 0..<4 {
                    let ny = cur.0 + dy[dir]
                    let nx = cur.1 + dx[dir]
                    
                    if ny < 0 || nx < 0 || ny >= 12 || nx >= 6 { continue }
                    if board[ny][nx] != board[cur.0][cur.1] { continue }
                    if visited[ny][nx] { continue }
                    
                    bombQueue.append((ny, nx))
                    visited[ny][nx] = true
                }
            }
            
            // 터뜨리기
            if bombQueue.count >= 4 {
                bombQueue.forEach { board[$0.0][$0.1] = "@" }
                bombFlag = true
            }
        }
    }
    
    if !bombFlag { break }
    
    // 내리기
    // 여러군데에서 터져도 한번의 연쇄이다.
    bombCount += 1
    board = downItem(bombBoard: board)
}

print(bombCount)

func downItem(bombBoard: [[String]]) -> [[String]] {
    var newBoard = bombBoard
    
    for sero in 0..<12 {
        for garo in 0..<6 {
            if newBoard[sero][garo] != "@" { continue }
            
            for down in (1..<sero+1).reversed() {
                newBoard[down][garo] = newBoard[down - 1][garo]
            }
            newBoard[0][garo] = "."
        }
    }
    
    return newBoard
}
