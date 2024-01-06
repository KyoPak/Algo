let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let start = input[0]
let target = input[1]

let maxNumber = 100001
// 시간, 그 전 위치
var board: [(Int, Int)] = Array(repeating: (-1, -1), count: 100001)

var queue: [Int] = [start]
board[start] = (0, start)

var index = 0
while index < queue.count {
    if board[target].0 != -1 { break }
    let cur = queue[index]
    index += 1
    
    for dir in [cur - 1, cur + 1, cur * 2] {
        if dir < 0 || dir >= maxNumber { continue }
        if board[dir].0 != -1 { continue }
        
        board[dir].0 = board[cur].0 + 1
        board[dir].1 = cur
        
        queue.append(dir)
    }
}

print(board[target].0)

var tempTarget = target
var path: [Int] = []
while tempTarget != start {
    path.append(board[tempTarget].1)
    tempTarget = board[tempTarget].1
}

path.reverse()
path.forEach {
    print($0, terminator: " ")
}
print(target)
