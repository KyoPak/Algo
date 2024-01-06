// 240106_백준_12869_뮤탈리스크
// 유형 - DP? BFS?

let n = Int(readLine()!)!
var scvs = readLine()!.split(separator: " ").map { Int(String($0))! }

while scvs.count != 3 {
    scvs.append(0)
}

var visited: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: scvs[2] + 1), count: scvs[1] + 1), count: scvs[0] + 1)
// visited[i][j][k] : i, j, k가 되는 공격의 횟수

let attacks = [
    [9, 3, 1], [9, 1, 3], [3, 1, 9], [3, 9, 1], [1, 3, 9], [1, 9, 3]
]

var queue: [(Int, Int, Int)] = [(scvs[0], scvs[1], scvs[2])]
var index = 0

while index < queue.count {
    if visited[0][0][0] != 0 { break }
    
    var cur = queue[index]
    index += 1
    
    for attack in attacks {
        let fir = max(cur.0 - attack[0], 0) // 음수로는 못내려감.
        let sec = max(cur.1 - attack[1], 0)
        let thi = max(cur.2 - attack[2], 0)
        
        if visited[fir][sec][thi] != 0 { continue }
        visited[fir][sec][thi] = visited[cur.0][cur.1][cur.2] + 1
        queue.append((fir, sec, thi))
    }
}

print(visited[0][0][0])
