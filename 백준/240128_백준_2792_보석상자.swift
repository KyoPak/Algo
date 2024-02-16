// 240128_백준_2792_보석상자

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]    // 아이들의 수
let m = input[1]    // 색상의 수

var list: [Int] = []
for _ in 0..<m {
    list.append(Int(readLine()!)!)
}

// 보석은 다 나눠줘야한다.
// 보석을 받지 못하는 학생이 있어도 된다.
var answer = Int.max
var left = 1
var right = list.max()!

while left <= right {
    let mid = (left + right) / 2

    if check(mid: mid) {
        answer = min(answer, mid)
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(answer)

func check(mid: Int) -> Bool {
    // mid개 씩 나눠준다면
    var value = 0
    for index in 0..<list.count {
        value += list[index] / mid
        if list[index] % mid != 0 { value += 1 }
    }
    
    // 아이들 수 보다 많이 나눠주면 안댐
    return value <= n
}
