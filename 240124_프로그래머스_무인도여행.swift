import Foundation

func solution(_ maps:[String]) -> [Int] {
    var board: [[Int]] = []
    
    for yIndex in 0..<maps.count {
        let line = maps[yIndex].map { String($0) }
        var temp: [Int] = []
        for xIndex in 0..<line.count {
            if line[xIndex] == "X" {
                temp.append(-1)
                continue
            }
            
            temp.append(Int(line[xIndex])!)
        }
        
        board.append(temp)
    }
    
    var answer: [Int] = []
    var visited: [[Bool]] = Array(
        repeating: Array(repeating: false, count: board[0].count),
        count: board.count
    )
    
    // BFS
    let dy = [0, 1, 0, -1]
    let dx = [1, 0, -1, 0]
    
    for sero in 0..<board.count {
        for garo in 0..<board[0].count {
            if visited[sero][garo] || board[sero][garo] == -1 { continue }
            
            var queue: [(Int, Int)] = [(sero, garo)]
            visited[sero][garo] = true
            var value = board[sero][garo]
            var index = 0
            
            while index < queue.count {
                let cur = queue[index]
                index += 1
                
                for dir in 0..<4 {
                    let ny = cur.0 + dy[dir]
                    let nx = cur.1 + dx[dir]
                    if ny < 0 || nx < 0 || ny >= board.count || nx >= board[0].count { continue }
                    if visited[ny][nx] || board[ny][nx] == -1 { continue }
                    
                    queue.append((ny, nx))
                    value += board[ny][nx]
                    visited[ny][nx] = true
                }
            }
            answer.append(value)
        }
    }
    
    return answer.isEmpty ? [-1] : answer.sorted(by: <)
}
