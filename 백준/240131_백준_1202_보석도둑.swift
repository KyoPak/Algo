// 240131_백준_1202_보석도둑
// 우선순위큐에서 시간초과 발생.. C++에서는 통과된다...

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]    // 보석종류
let k = input[1]    // 가방 갯수

var jew: [(Int, Int)] = []  // (무게, 가격)

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    jew.append((line[0], line[1]))
}

var bags: [Int] = []
for _ in 0..<k {
    bags.append(Int(readLine()!)!)
}

jew.sort { return $0.0 < $1.0 }
bags.sort { return $0 < $1 }

var answer = 0
var steelBag: [Int] = [] // 훔칠 수 있는 보석
var jIndex = 0
for bag in bags {
  // 가방보다 무게가 작다면 훔친 가방에 모두 넣는다.
    while jIndex < jew.count && bag >= jew[jIndex].0 {
        steelBag.append(jew[jIndex].1)
        jIndex += 1
    }
    
    steelBag.sort(by: <)
  // 훔친 가방에서 가장 가치가 큰 1개를 뺀다.
    if !steelBag.isEmpty {
        answer += steelBag.removeLast()
    }
}

print(answer)
