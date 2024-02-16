// 240202_백준_1068_트리

let n = Int(readLine()!)!
var node = readLine()!.split(separator: " ").map { Int(String($0))! }
var board: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

var start = 0
for index in 0..<node.count {
    if node[index] == -1 { start = index }
    else { board[node[index]][index] = 1 }
}

var removeNode = Int(readLine()!)!
var leaf = 0
dfs(node: start)
print(leaf)

func dfs(node: Int) {
    if node == removeNode { return }
    
    var leafCount = 0
    for child in 0..<n {
        if board[node][child] == 1 {
            if child == removeNode { leafCount += 1 }
            else { dfs(node: child) }
        } else if board[node][child] == 0 {
            leafCount += 1
        }
    }
    
    if leafCount == n { leaf += 1 }
}
