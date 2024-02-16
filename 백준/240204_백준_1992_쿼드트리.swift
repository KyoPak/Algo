// 240204_백준_1992_쿼드트리

var size = Int(readLine()!)!

var board: [[Int]] = []
for _ in 0..<size {
    let line = readLine()!.map { Int(String($0))! }
    board.append(line)
}

var answer = ""

dfs(startY: 0, endY: size, startX: 0, endX: size, length: size)
print(answer)

func dfs(startY: Int, endY: Int, startX: Int, endX: Int, length: Int) {
    let result = check(startY: startY, endY: endY, startX: startX, endX: endX)
    switch result {
    case 1:
        answer += "1"
    case 0:
        answer += "0"
    default :
        answer += "("
        var newLength = length / 2
        dfs(startY: startY, endY: startY + newLength, startX: startX, endX: startX + newLength, length: newLength)
        dfs(startY: startY, endY: startY + newLength, startX: startX + newLength, endX: endX, length: newLength)
        dfs(startY: startY + newLength, endY: endY, startX: startX, endX: startX + newLength, length: newLength)
        dfs(startY: startY + newLength, endY: endY, startX: startX + newLength, endX: endX, length: newLength)
        answer += ")"
    }
}

func check(startY: Int, endY: Int, startX: Int, endX: Int) -> Int {
    var oneCount = 0
    var zeroCount = 0
    for sero in startY..<endY {
        for garo in startX..<endX {
            if board[sero][garo] == 1 {
                oneCount += 1
            } else {
                zeroCount += 1
            }
        }
    }
    
    return oneCount != 0 && zeroCount != 0 ? -1 : (oneCount == 0 ? 0 : 1)
}
