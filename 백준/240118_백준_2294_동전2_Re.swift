// 240118_백준_2294_동전2_Re

var line = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = line[1]
var board: [Int] = []
for _ in 0..<line[0] {
    board.append(Int(readLine()!)!)
}

let maxNumber = 10_001
var dp: [Int] = Array(repeating: maxNumber, count: k + 1)
dp[0] = 0

for coin in board {
    if coin > k + 1 { continue }
    for number in coin..<k+1 {
        dp[number] = min(dp[number], dp[number - coin] + 1)
    }
}

if dp[k] == maxNumber { print(-1) }
else { print(dp[k]) }
