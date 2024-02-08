// 240208_백준_19942_다이어트

var total = Int(readLine()!)!

var allCase: [[Int]] = []
// 단, 지, 탄, 비
var target = readLine()!.split(separator: " ").map { Int(String($0))! }

var board: [[Int]] = []
for _ in 0..<total {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var minPrice = Int.max
var answer: [Int] = []

foundAllCase(temp: [], index: 0)
for oneCase in allCase {
    var price = 0
    for index in oneCase {
        price += board[index][4]
    }
    
    if minPrice > price {
        minPrice = price
        answer = oneCase.map { $0 + 1 }
    }
}

// OUTPUT
if minPrice == Int.max {
    print(-1)
} else {
    print(minPrice)
    answer.forEach { print($0, terminator: " ") }
}

// 조합
func foundAllCase(temp: [Int], index: Int) {
    var one = 0
    var two = 0
    var three = 0
    var four = 0

    for index in temp {
        one += board[index][0] // 단
        two += board[index][1] // 지
        three += board[index][2] // 탄
        four += board[index][3] // 비
    }
   
    if one >= target[0] && two >= target[1] && three >= target[2] && four >= target[3] {
        allCase.append(temp)
        return
    }
    
    for i in index..<total {
        var temp = temp
        temp.append(i)
        foundAllCase(temp: temp, index: i + 1)
    }
}
