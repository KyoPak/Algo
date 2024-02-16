// 240126_백준_2805_나무자르기
var input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]    // 나무의 수
let m = input[1]    // 필요한 나무의 길이

var list: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

// 자르는 높이가 0과 같은 수 있다.
var left = 0
var right = list.max()!
var answer = Int.min

while left <= right {
    let mid = (left + right) / 2
    
    let take = check(mid: mid)
    
    if take >= m {
        // 최대 높이로 잘라야 나무를 조금만 자른다.
        answer = max(mid, answer)
        left = mid + 1
    } else if take < m {
        // 더 낮게 잘라야한다.
        right = mid - 1
    }
}

print(answer)

func check(mid: Int) -> Int {
    var value = 0
    for item in list {
        value += (item - mid < 0) ? 0 : item - mid
    }
    
    return value
}
