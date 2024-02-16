// 240118_백준_3190_뱀.swift

let size = Int(readLine()!)!
let k = Int(readLine()!)!       // 사과 위치

var board: [[Int]] = Array(repeating: Array(repeating: 0, count: size), count: size)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: size), count: size)

for _ in 0..<k {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board[line[0] - 1][line[1] - 1] = 1
}

let l = Int(readLine()!)!        // 방향 전환 횟수
var times: [Int] = []
var opers: [String] = []
for _ in 0..<l {
    let line = readLine()!.split(separator: " ").map { String($0) }
    times.append(Int(line[0])!)
    opers.append(line[1])
}

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var time = 0
var timeIndex = 0
var dir = 0 // 처음 방향은 오른쪽
var body: [(Int, Int)] = [(0, 0)]
visited[0][0] = true

while true {
    time += 1
    
    let ny = body.last!.0 + dy[dir]
    let nx = body.last!.1 + dx[dir]
    
    // 벽에 닿거나, 몸에 부딫치면 게임 종료
    if ny < 0 || nx < 0 || ny >= size || nx >= size { break }
    if visited[ny][nx] { break }
    
    body.append((ny, nx)) // 몸길이 늘어난다.
    visited[ny][nx] = true
    if board[ny][nx] == 1 {
        board[ny][nx] = 0
    } else {
        let tail = body.removeFirst()
        visited[tail.0][tail.1] = false
    }
    
    // 시간 달성 시, 방향 회전
    if timeIndex < times.count && time == times[timeIndex] {
        if opers[timeIndex] == "L" {    // 왼쪽
            dir = (dir + 3) % 4
        }
        if opers[timeIndex] == "D" {    // 오른쪽
            dir = (dir + 1) % 4
        }
        
        timeIndex += 1
    }
}

print(time)
