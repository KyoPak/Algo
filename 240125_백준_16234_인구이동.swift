// 240125_백준_16234_인구이동

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let l = input[1]
let r = input[2]

var board: [[Int]] = []
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}

var day = 0

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

// 인구 이동이 가능할 때 까지 반복.
while true {
    var visited: [[Bool]] = Array(
        repeating: Array(repeating: false, count: n),
        count: n
    )
    var flag = false
    
    // 연합이 여러개가 생길 수 있다.
    for sero in 0..<n {
        for garo in 0..<n {
            if visited[sero][garo] { continue }
            
            // 연합 시작점
            var queue: [(Int, Int)] = [(sero, garo)]
            var index = 0
            visited[sero][garo] = true
            
            var sum = board[sero][garo]
            var country = 1
            
            while queue.count > index {
                let cur = queue[index]
                index += 1
                
                for dir in 0..<4 {
                    let ny = cur.0 + dy[dir]
                    let nx = cur.1 + dx[dir]
                    
                    if ny < 0 || nx < 0 || ny >= n || nx >= n { continue }
                    if visited[ny][nx] { continue }
                    if !checkABS(numA: board[ny][nx], numB: board[cur.0][cur.1]) { continue }
                    
                    sum += board[ny][nx]
                    country += 1
                    
                    queue.append((ny, nx))
                    visited[ny][nx] = true
                    
                    flag = true // 인구 이동이 발생함
                }
            }
            
            for i in 0..<queue.count {
                board[queue[i].0][queue[i].1] = sum / country
            }
        }
    }
    
    if !flag { break }
    day += 1
}

func checkABS(numA: Int, numB: Int) -> Bool {
    let diff = abs(numA - numB)
    if diff >= l && diff <= r { return true }
    return false
}

print(day)
