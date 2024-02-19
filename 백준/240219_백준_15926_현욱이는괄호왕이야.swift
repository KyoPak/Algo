// 240219_백준_15926_현욱이는괄호왕이야.swift
let n = Int(readLine()!)!
let texts = readLine()!.map { String($0) }

var check: [Bool] = Array(repeating: false, count: n)
var stack: [Int] = []
for index in 0..<texts.count {
    if texts[index] == "(" {
        stack.append(index)
    }
    
    if texts[index] == ")" {
        if !stack.isEmpty {
            check[stack.removeLast()] = true
            check[index] = true
        }
    }
}

var answer = 0
var cnt = 0

for index in 0..<check.count {
    if check[index] {
        cnt += 1
        answer = max(answer, cnt)
    } else {
        cnt = 0
    }
}

print(answer)
