// 240216_백준_13144_ListOfUniqueNumbers

// 라인 스위핑

let number = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var start = 0
var end = 0

var dict: [Int: Bool] = [:]
for num in numbers { dict[num] = false }

var answer = 0
while end < number {
    if dict[numbers[end]]! {
        answer += end - start
        dict[numbers[start]]! = false
        start += 1
        continue
    }
 
    dict[numbers[end]] = true
    end += 1
}

answer += (end - start + 1) * (end - start) / 2

print(answer)
