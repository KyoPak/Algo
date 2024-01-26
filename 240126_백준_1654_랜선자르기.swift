// 240126_백준_1654_랜선자르기
import Foundation

var input = readLine()!.split(separator: " ").map { Int(String($0))! }

let k = input[0]    // 이미 가지고 있는 랜선의 갯수
let n = input[1]    // 필요한 랜선의 갯수

var list: [Int] = []
var maxLength = 0
for _ in 0..<k {
    list.append(Int(readLine()!)!)
    maxLength = max(maxLength, list.last!)
}

// left가 0부터 시작한다면 mid가 0이 되는 경우, RunTime오류가 발생할 수 있다.
var left = 1
var right = maxLength
var answer = 0

while left <= right {
    var mid = (left + right) / 2
    
    if check(middle: mid) {
        if answer < mid {
            answer = mid
        }
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(answer)

func check(middle: Int) -> Bool {
    var len = 0
    for index in 0..<list.count {
        len += list[index] / middle
    }
    
    return len >= n
}
