// 240201_백준_1325_효율적인해킹
// 메모리초과 - 빡빡한듯 ;;

// N개의 컴퓨터로 이루어져있다.
// 한번의 해킹으로 여러 개의 해킹이 가능한 컴퓨터를 해킹하고자 한다.
// A가 B를 신뢰하면 B를 해킹하면 A를 해킹할 수 있다.

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]    // 컴퓨터 갯수
let m = input[1]    // 관계 수

var board: [[Int]] = Array(
    repeating: Array(repeating: 0, count: n + 1),
    count: n + 1
)

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board[line[1]][line[0]] = 1
}

// 컴퓨터 번호와 해킹한 컴퓨터 갯수
var answerList: [(Int, Int)] = []
var maxComputer = 0

for computer in 1..<n+1 {
    var hackingList: [Int] = [computer]
    var hackingIndex = 0
    var visited: [Bool] = Array(repeating: false, count: n + 1)
    visited[computer] = true
    
    while hackingIndex < hackingList.count {
        let cur = hackingList[hackingIndex]
        hackingIndex += 1
        
        for index in 0..<board[cur].count {
            if board[cur][index] == 0 { continue }
            if visited[index] { continue }
            
            visited[index] = true
            hackingList.append(index)
        }
    }
    
    answerList.append((computer, hackingList.count))
    maxComputer = max(maxComputer, hackingList.count)
}

answerList.sort { return $0.0 < $1.0 }
answerList.filter { $0.1 == maxComputer }.forEach { print($0.0, terminator: " ") }
