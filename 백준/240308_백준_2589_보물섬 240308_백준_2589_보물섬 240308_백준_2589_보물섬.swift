// 240308_백준_2589_보물섬

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]    // 세로
let m = input[1]    // 가로

var board: [[String]] = []
var visited: [[Int]] = Array(repeating: Array(repeating: -1, count: m), count: n)
var starts: [(Int, Int)] = []

for sero in 0..<n {
    let line = readLine()!.map { String($0) }
    board.append(line)
    for garo in 0..<m {
        if line[garo] == "L" {
            starts.append((sero, garo))
        }
    }
}

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]
var answer = -1

for start in starts {
    var tempVisited = visited
    tempVisited[start.0][start.1] = 0
    var queue: [(Int, Int)] = [start]
    var index = 0
    
    while index < queue.count {
        let cur = queue[index]
        index += 1
        
        for dir in 0..<4 {
            let ny = cur.0 + dy[dir]
            let nx = cur.1 + dx[dir]
            
            if ny < 0 || nx < 0 || ny >= n || nx >= m { continue }
            if tempVisited[ny][nx] != -1 { continue }
            if board[ny][nx] != "L" { continue }
            
            tempVisited[ny][nx] = tempVisited[cur.0][cur.1] + 1
            queue.append((ny, nx))
        }
    }
    
    answer = max(answer, tempVisited.flatMap { $0 }.max()!)
}

print(answer)
