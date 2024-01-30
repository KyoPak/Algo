// 이분 탐색으로 풀었지만, a, b모두 sort하고 비교해서 index 늘려가도 된다.
import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var answer = 0
    var sortB = b.sorted(by: <)
    
    for index in 0..<a.count {
        let target = a[index]
        
        var left = 0
        var right = sortB.count - 1
        var currentScore = 0
        var removeTarget = -1
        while left <= right {
            let mid = (left + right) / 2    
            if target < sortB[mid] {
                right = mid - 1
                removeTarget = mid
                currentScore = 1
            } else if target >= sortB[mid] {
                left = mid + 1 
            }
        }
        
        if removeTarget != -1 { sortB.remove(at: removeTarget) }
        answer += currentScore
    }
    
    return answer
}
