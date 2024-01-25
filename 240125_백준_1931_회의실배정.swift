// 240125_백준_1931_회의실배정

let totalCase = Int(readLine()!)!

// [(시작시간, 종료시간)]
var list: [(Int, Int)] = []
for _ in 0..<totalCase {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    list.append((input[0], input[1]))
}

// 끝나는 시간 오름차순, 시작시간 오름차순
list.sort {
    if $0.1 == $1.1 { return $0.0 < $1.0 }
    return $0.1 < $1.1
}

var answer = 0
var endTime = -1
for index in 0..<list.count {
    if endTime <= list[index].0 {
        endTime = list[index].1
        answer += 1
    }
}

print(answer)
