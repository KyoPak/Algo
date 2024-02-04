// 240204_백준_2559_수열

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]    // 전체 날짜
let k = input[1]    // 연속적인 날짜

let list = readLine()!.split(separator: " ").map { Int(String($0))! }
var newList: [Int] = []

var value = 0
for index in 0..<list.count {
    value += list[index]
    newList.append(value)
}

newList.insert(0, at: 0)

var maxNum = Int.min
for index in k..<newList.count {
    maxNum = max(maxNum, newList[index] - newList[index - k])
}

print(maxNum)
