// 240106_백준_20922_겹치는건싫어

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var dict: [Int: Int] = [:]
var length = 0
var start = 0
var end = 0

while start <= end {
    if end >= numbers.count { break }
    
    if (dict[numbers[end]] ?? 0) < input[1] {
        dict[numbers[end]] = (dict[numbers[end]] ?? 0) + 1
        end += 1
    } else {
        dict[numbers[start]]! -= 1
        start += 1
    }
    
    length = max(length, end - start)
}

print(length)
