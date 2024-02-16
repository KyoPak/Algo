// 백준_1535_안녕
// 유형 - DP

let totalCase = Int(readLine()!)!
var cost = readLine()!.split(separator: " ").map { Int(String($0))! }
var value = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp = Array(repeating: 0, count: 101)
// dp[i] : hp가 i일 때 얻을 수 있는 최대 기쁨양

for coastIndex in 0..<cost.count {
    var currentCost = cost[coastIndex]
    var currentValue = value[coastIndex]
    
    for hp in (currentCost + 1..<101).reversed() {
        dp[hp] = max(dp[hp], dp[hp - currentCost] + currentValue)
    }
}

print(dp[100])
