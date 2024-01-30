// 240130_백준_14627_파닭파닭

// 길이가 일정하지 않은 파 구매
// 최대한 많은 파를 넣는다. 하나의 파는 X
// 남는 파를 라면에 넣는다.
// 라면에 넣을 파의 양은?

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let s = input[0]    // 파의 총 갯수
let c = input[1]    // 주문받은 파닭의 수

var list: [Int] = []    // 파의 각 길이

for _ in 0..<s {
    list.append(Int(readLine()!)!)
}

var left = 1
var right = list.max()! // 파 하나를 통재로 넣지는 못한다.

var cuttingSize = 0

while left <= right {
    let mid = (left + right) / 2
    
    if check(size: mid) {
        cuttingSize = mid
        left = mid + 1  // 파 길이를 더 늘려보기
    } else {
        right = mid - 1
    }
}

print(list.reduce(0, +) - (cuttingSize * c))

func check(size: Int) -> Bool {
    // 파를 size로 잘랐을때 c개의 파닭을 커버할 수 있는지
    var value = 0
    for item in list {
        value += item / size
    }
    
    // 커버 가능 여부
    return c <= value
}
