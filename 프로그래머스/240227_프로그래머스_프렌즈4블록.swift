// 240227_프로그래머스_프렌즈4블록
func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var answer = 0
    
    var tempBoard: [[String]] = []
    for item in board {
        tempBoard.append(item.map { String($0) })
    }
    
    while true {
        let checkBoard = check(board: tempBoard)
        let result = bomb(board: tempBoard, checkBoard: checkBoard)
        
        if result.1 == 0 { break }
        answer += result.1
        tempBoard = down(board: result.0)
    }
    
    return answer
}

func check(board: [[String]]) -> [[Bool]] {
    var checkBoard: [[Bool]] = Array(repeating: Array(repeating: false,count: board[0].count), count: board.count)
    let dy = [0, 1, 1]
    let dx = [1, 0, 1]
    
    for sero in 0..<board.count {
        for garo in 0..<board[sero].count {
            if board[sero][garo] == "" { continue }
            var location: [(Int, Int)] = []
            for dir in 0..<3 {
                let ny = sero + dy[dir]
                let nx = garo + dx[dir]
                if ny < 0 || nx < 0 || ny >= board.count || nx >= board[0].count { break }
                if board[ny][nx] != board[sero][garo] { break }
                location.append((ny, nx))
            }
            
            if location.count != 3 { continue }
            checkBoard[sero][garo] = true
            location.forEach { checkBoard[$0.0][$0.1] = true }
        }
    }
    
    return checkBoard
}

func bomb(board: [[String]], checkBoard: [[Bool]]) -> ([[String]], Int) {
    var cnt = 0
    var tempBoard = board
    for sero in 0..<board.count {
        for garo in 0..<board[sero].count {
            if checkBoard[sero][garo] {
                tempBoard[sero][garo] = ""
                cnt += 1
            }
        }
    }
    
    return (tempBoard, cnt)
}

func down(board: [[String]]) -> [[String]] {
    var tempBoard = board
    
    for garo in 0..<board[0].count {
        for sero in (1..<board.count).reversed() {
            
            if tempBoard[sero][garo] == "" {
                var i = 1
                while sero - i > 0 && tempBoard[sero - i][garo] == "" {
                    i += 1
                }
                
                tempBoard[sero][garo] = tempBoard[sero - i][garo]
                tempBoard[sero - i][garo] = ""
            }
        }
    }
    
    return tempBoard
}
