// 240125_백준_2109_순회강연

let totalCase = Int(readLine()!)!

// (보상, 날짜)
var list: [(Int, Int)] = []
for _ in 0..<totalCase {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    list.append((input[0], input[1]))
}

// 날짜 오름차순, 보상 내림차순
list.sort {
    if $0.1 == $1.1 { return $0.0 > $0.1 }
    return $0.1 < $1.1
}

var answer: [Int] = []
for item in list {
    answer.sort(by: >)
    if answer.count < item.1 {
        answer.append(item.0)
        continue
    }
    
    if answer.last! < item.0 {
        answer.removeLast()
        answer.append(item.0)
    }
}

print(answer.reduce(0, +))
