// 240216_백준_17144_미세먼지안녕

/*
 1. 확산
 2. 한칸 씩 이동
 */

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let r = input[0]    // 세로
let c = input[1]    // 가로
let t = input[2]    // 시간

var originBoard: [[Int]] = []
var cleaner: [(Int, Int)] = []
for sero in 0..<r {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    originBoard.append(line)
    
    for garo in 0..<c {
        if line[garo] == -1 { cleaner.append((sero, garo)) }
    }
}

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

var time = 0
while time < t {
    time += 1
    
    // 1. 확산
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: c), count: r)
    
    for sero in 0..<r {
        for garo in 0..<c {
            if originBoard[sero][garo] == 0 { continue }
            if originBoard[sero][garo] == -1 { continue }
            
            var sideLocation: [(Int, Int)] = []
            var cnt = 0
            for dir in 0..<4 {
                let ny = sero + dy[dir]
                let nx = garo + dx[dir]
                
                
                if ny < 0 || nx < 0 || ny >= r || nx >= c { continue }
                if originBoard[ny][nx] == -1 { continue }
                sideLocation.append((ny, nx))
                cnt += 1
            }
            
            let remainDust = originBoard[sero][garo] - ((originBoard[sero][garo] / 5) * cnt)
            let spreadDust = originBoard[sero][garo] / 5
            
            sideLocation.forEach { board[$0.0][$0.1] += spreadDust }
            originBoard[sero][garo] = remainDust
        }
    }
    
    for sero in 0..<r {
        for garo in 0..<c {
            originBoard[sero][garo] += board[sero][garo]
        }
    }
    
    // 2. 로테이트
    // cleaner 윗 부분
    var tempBoard = originBoard
    
    for garo in 0..<c-1 { // 위
        if originBoard[0][garo] == -1 { continue }
        tempBoard[0][garo] = originBoard[0][garo + 1] == -1 ? 0 : originBoard[0][garo + 1]
    }
    
    for sero in 0..<cleaner[0].0 { // 오른
        if originBoard[sero][c-1] == -1 { continue }
        tempBoard[sero][c-1] = originBoard[sero + 1][c-1] == -1 ? 0 : originBoard[sero + 1][c-1]
    }
    
    for garo in 1..<c {
        if originBoard[cleaner[0].0][garo] == -1 { continue }
        tempBoard[cleaner[0].0][garo] = originBoard[cleaner[0].0][garo - 1] == -1 ? 0 : originBoard[cleaner[0].0][garo - 1]
    }
    
    for sero in 1..<cleaner[0].0 {
        if originBoard[sero][0] == -1 { continue }
        tempBoard[sero][0] = originBoard[sero - 1][0] == -1 ? 0 : originBoard[sero - 1][0]
    }
    
    // cleaner 아랫 부분
    for garo in 1..<c { // 위
        if originBoard[cleaner[1].0][garo] == -1 { continue }
        tempBoard[cleaner[1].0][garo] = originBoard[cleaner[1].0][garo - 1] == -1 ?
            0 : originBoard[cleaner[1].0][garo - 1]
    }
    
    for sero in cleaner[1].0+1..<r {
        if originBoard[sero][c-1] == -1 { continue }
        tempBoard[sero][c-1] = originBoard[sero - 1][c-1] == -1 ? 0 : originBoard[sero - 1][c-1]
    }
    
    for garo in 0..<c-1 {
        if originBoard[r-1][garo] == -1 { continue }
        tempBoard[r-1][garo] = originBoard[r-1][garo + 1] == -1 ? 0 : originBoard[r-1][garo + 1]
    }
    
    for sero in cleaner[1].0..<r-1 {
        if originBoard[sero][0] == -1 { continue }
        tempBoard[sero][0] = originBoard[sero + 1][0] == -1 ? 0 : originBoard[sero + 1][0]
    }
    
    originBoard = tempBoard
}

print(originBoard.flatMap { $0 }.filter { $0 != -1 }.reduce(0, +))
