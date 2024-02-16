import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var answer = n
    
    for removeIndex in 0..<wires.count {
        var board: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        var visited: [Int] = Array(repeating: 0, count: n + 1)
        
        // 전력망 한개 끊은 배열 내부 구현
        for index in 0..<wires.count {
            if index == removeIndex { continue }
            
            board[wires[index][0]][wires[index][1]] = 1
            board[wires[index][1]][wires[index][0]] = 1
        }
    
        // BFS 시작 
        var queue: [Int] = [1]
        visited[1] = 1
        var qIndex = 0
        while qIndex < queue.count {
            let cur = queue[qIndex]
            qIndex += 1
            
            for linkIndex in 1..<board[cur].count {
                if board[cur][linkIndex] == 0 { continue }
                if visited[linkIndex] != 0 { continue }
                
                queue.append(linkIndex)
                visited[linkIndex] = 1        
            }
        }
        
        // 연결 된 한 부분
        let link = n - visited.filter { $0 == 1 }.count
        answer = min(answer, abs(n - link - link))
    }
    
    return answer
}
