// 240126_프로그래머스_리코쳇로봇.swift
import Foundation

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1 ,0]

var newBoard: [[String]] = []
func solution(_ board:[String]) -> Int {
    var queue: [(Int, Int)] = []
    var target: (Int, Int) = (-1, -1)
    for sero in 0..<board.count {
        let line = board[sero].map { String($0) }
        newBoard.append(line)
        
        for garo in 0..<newBoard[sero].count {
            if newBoard[sero][garo] == "R" { queue.append((sero, garo)) }
            if newBoard[sero][garo] == "G" { target = (sero, garo) }    
        }
    }
    
    // BFS
    var visited: [[Int]] = Array(
        repeating: Array(repeating: -1, count: newBoard[0].count),
        count: newBoard.count
    )
    
    visited[queue[0].0][queue[0].1] = 0
    
    var index = 0
    while index < queue.count {
        let cur = queue[index]
        index += 1
        if cur.0 == target.0 && cur.1 == target.1 { break }
        
        for dir in 0..<4 {
            var nextPoint = sliding(y: cur.0, x: cur.1, dir: dir)
            let ny = nextPoint.0
            let nx = nextPoint.1
            
            if visited[ny][nx] != -1 { continue }
            
            queue.append((ny, nx))
            visited[ny][nx] = visited[cur.0][cur.1] + 1
        }
    }
    
    return visited[target.0][target.1]
}

func sliding(y: Int, x: Int, dir: Int) -> (Int, Int) {
    var ny = y
    var nx = x
    while true {
        let tempY = ny + dy[dir]
        let tempX = nx + dx[dir]
        if tempY < 0 || tempX < 0 || 
            tempY >= newBoard.count || tempX >= newBoard[0].count { break }
        if newBoard[tempY][tempX] == "D" { break }
        ny = tempY
        nx = tempX
    }
    
    return (ny, nx)
}
