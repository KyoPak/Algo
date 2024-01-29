// 240129_프로그래머스_입국심사
import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var sortTime = times.sorted(by: <)
    var left = 0
    var right = times.max()! * n
    
    var answer = 0
    while left <= right {
        let mid = (left + right) / 2
        
        if check(time: mid, times: times, n: n) {
            answer = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return Int64(answer)
}

func check(time: Int, times: [Int], n: Int) -> Bool {
    // time 안에 모든 사람을 심사할 수 있는지 체크
    var value = 0
    for index in 0..<times.count {
        value += time / times[index]
    }
    
    // time 동안 value만큼의 사람의 심사가 가능하다.
    return n <= value
}
