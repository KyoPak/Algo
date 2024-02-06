// 240206_백준_17406_배열돌리기

// 각행의 모든 수의 합중 최솟값을 구하라.
// 가장 왼쪽 윗칸 (r-s, c-s) 가장 오른쪽 아랫칸 (r+s, c+s)
// 시계방향 Rotate

// (3 - 2 - 1, 4 - 2 - 1) 시작  ~ (3 + 2 - 1, 4 + 2 - 1)

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]    // 세로
let m = input[1]    // 가로
let k = input[2]    // 회전 횟수

var originBoard: [[Int]] = []
var opers: [(Int, Int, Int)] = []
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    originBoard.append(line)
}

for _ in 0..<k {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    opers.append((line[0], line[1], line[2]))
}

var visited: [Bool] = Array(repeating: false, count: k)
var allCase :[[Int]] = []
foundAllCase(temp: [])
var minValue = Int.max

var board = originBoard

for oneCase in allCase {    // 회전은 순차적으로 일어나지 않는다.
    board = originBoard
    
    for index in oneCase {
        var start = (opers[index].0 - opers[index].2 - 1, opers[index].1 - opers[index].2 - 1)
        var end = (opers[index].0 + opers[index].2 - 1, opers[index].1 + opers[index].2 - 1)
        
        while start != end {
            rotate(startY: start.0, startX: start.1, endY: end.0, endX: end.1)
            start = (start.0 + 1, start.1 + 1)
            end = (end.0 - 1, end.1 - 1)
        }
    }
    
    for item in board {
        minValue = min(item.reduce(0, +), minValue)
    }
}

print(minValue)

// 순열
func foundAllCase(temp: [Int]) {
    if temp.count == k {
        allCase.append(temp)
        return
    }
    
    for index in 0..<k {
        if visited[index] { continue }
        visited[index] = true
        
        var temp = temp
        temp.append(index)
        foundAllCase(temp: temp)
        visited[index] = false
    }
}

func rotate(startY: Int, startX: Int, endY: Int, endX: Int) {
    var tempBoard = board
    
    for garo in startX + 1..<endX+1 {
        tempBoard[startY][garo] = board[startY][garo - 1]
    }
    
    for sero in startY + 1..<endY+1 {
        tempBoard[sero][endX] = board[sero - 1][endX]
    }
    
    for garo in startX..<endX {
        tempBoard[endY][garo] = board[endY][garo + 1]
    }
    
    for sero in startY..<endY {
        tempBoard[sero][startX] = board[sero + 1][startX]
    }
    
    board = tempBoard
}
