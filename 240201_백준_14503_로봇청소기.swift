// 240201_백준_14503_로봇청소기

// 0은 미청소, 1은 벽

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]    // 세로
let m = input[1]    // 가로

var startInput = readLine()!.split(separator: " ").map { Int(String($0))! }
var board: [[Int]] = []

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}

var index = 0
var location: [Int] = [startInput[0], startInput[1]]    // 청소기 위치
var currentDir = startInput[2]
var cleanPoint = 0

while true {
    // 먼지 있다면 청소
    if board[location[0]][location[1]] == 0 {
        board[location[0]][location[1]] = -1 // 청소 완료
        cleanPoint += 1
    }
    
    var aroundDust = false
    // 주변 4공간에 먼지 존재 여부 Check
    for dir in 0..<4 {
        let ny = location[0] + dy[dir]
        let nx = location[1] + dx[dir]
        if ny < 0 || nx < 0 || ny >= n || nx >= m { continue }
        if board[ny][nx] != 0 { continue }
        aroundDust = true
        break
    }
    
    if aroundDust { // 먼지 존재한다면
        currentDir = (currentDir + 3) % 4   // 반시계 회전
        let ny = location[0] + dy[currentDir]
        let nx = location[1] + dx[currentDir]
        if ny < 0 || nx < 0 || ny >= n || nx >= m { continue }
        if board[ny][nx] == -1 || board[ny][nx] == 1 { continue }
        
        location[0] = ny // 먼지 있다면 앞으로 전진
        location[1] = nx
    } else {
        // 후진
        let ny = location[0] + dy[(currentDir + 2) % 4]
        let nx = location[1] + dx[(currentDir + 2) % 4]
        if ny < 0 || nx < 0 || ny >= n || nx >= m { break } // 끝이면 탈출
        if board[ny][nx] == 1 { break } // 벽이면 탈출
        location[0] = ny    // 뒤로 후진 가능하면 후진
        location[1] = nx
    }
}

print(cleanPoint)
