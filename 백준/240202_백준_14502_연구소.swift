// 240202_백준_14502_연구소

// 꼭 벽 3개를 세워야한다.
// 바이러스는 상하좌우로 퍼져나간다.
// 안전영역(0) 영역의 최댓값

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]    // 세로
let m = input[1]    // 가로

var board: [[Int]] = []
var originVirus: [(Int, Int)] = []
var safeList: [(Int, Int)] = []
var originVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)

// INPUT
for sero in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
    
    for garo in 0..<line.count {
        if line[garo] == 2 {
            originVirus.append((sero, garo))
            originVisited[sero][garo] = true
        }
        
        if line[garo] == 0 { safeList.append((sero, garo)) }
    }
}

// 추가로 세우는 벽 3개 모든 조합.
var wallList: [[(Int, Int)]] = []
var maxSafeArea = 0
choiceWall(temp: [], next: 0)

for list in wallList {
    var newBoard = board
    for location in list { newBoard[location.0][location.1] = 1 }   // 추가로 벽 세우기
    
    var visited = originVisited
    
    // BFS 시작
    var virus = originVirus
    var index = 0
    
    while index < virus.count {
        let cur = virus[index]
        index += 1
        
        for dir in 0..<4 {
            let ny = cur.0 + dy[dir]
            let nx = cur.1 + dx[dir]
            
            if ny < 0 || nx < 0 || ny >= n || nx >= m { continue }
            if visited[ny][nx] || newBoard[ny][nx] != 0 { continue }
            
            visited[ny][nx] = true
            newBoard[ny][nx] = 2
            virus.append((ny, nx))
        }
    }
    maxSafeArea = max(maxSafeArea, newBoard.flatMap { $0 }.filter { $0 == 0 }.count)
}

// OUTPUT
print(maxSafeArea)

// 벽 위치 3개 뽑기 - 조합 (순서 상관 없음)
func choiceWall(temp: [(Int, Int)], next: Int) {
    if temp.count == 3 {
        wallList.append(temp)
        return
    }
    
    for index in next..<safeList.count {
        var list = temp
        list.append(safeList[index])
        choiceWall(temp: list, next: index + 1) // index + 1로 재귀 진행해야한다.
    }
}
