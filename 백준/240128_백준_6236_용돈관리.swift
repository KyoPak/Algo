// 240128_백준_6236_용돈관리
var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0] // 날짜 별 금액
let m = input[1] // 인출 횟수

var list: [Int] = []

for _ in 0..<n {
    list.append(Int(readLine()!)!)
}

var left = 1
var right = list.reduce(0, +)
var answer = 0
while left <= right {
    let mid = (left + right) / 2
    
    if check(mid: mid) {
        answer = mid
        right = mid - 1
    } else {
        // 인출횟수가 너무 많으면 mid 늘려야한다.
        left = mid + 1
    }
}

print(answer)

func check(mid: Int) -> Bool {
    // mid 금액만큼 인출한다면 몇번 인출해야되는지
    // 인출금액이 하나의 요소보다 작으면 안된다.
    if mid < list.max()! { return false }
    
    var tempMid = mid
    var count = 1
    
    for index in 0..<list.count {
        if tempMid - list[index] < 0 {
            count += 1
            tempMid = mid - list[index]
            continue
        }
        
        tempMid -= list[index]
    }
    
    // 인출 횟수 count가 m보다 작은건 괜찮다.
    return count <= m
}
