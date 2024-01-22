import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    let maxNum = 9876654321
    var dp: [Int] = Array(repeating: maxNum, count: y + 1)
    dp[x] = 0
    dp[0] = 0
    
    for index in x..<y + 1{
        if index + n <= y {
            dp[index + n] = min(dp[index] + 1, dp[index + n])    
        }
        
        if index * 2 <= y {
            dp[index * 2] = min(dp[index] + 1, dp[index * 2])
        }
        
        if index * 3 <= y {
            dp[index * 3] = min(dp[index] + 1, dp[index * 3])
        }
    }
    
    return dp[y] == maxNum ? -1 : dp[y]
}
