// 240106_백준_2170_선긋기
// 유형 - 라인스위핑
// 일단 C++로 해당 로직 성공, Swift는 시간초과..

let n = Int(readLine()!)!
var board: [(Int, Int)] = []

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append((line[0], line[1]))
}

board.sort {
    if $0.0 == $1.0 { return $0.1 < $0.1 }
    return $0.0 < $1.0
}

var start = -1000000001
var end = -1000000001

var answer = 0
for index in 0..<board.count {
    if board[index].0 > end {
        answer += end - start
        start = board[index].0
        end = board[index].1
        continue
    }
    
    if board[index].1 > end {
        end = board[index].1
    }
}

answer += end - start
print(answer)
