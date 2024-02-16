// 240129_백준_7795_먹을것인가먹힐것인가.swift
let testCase = Int(readLine()!)!

var answer: [Int] = []
for _ in 0..<testCase {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let numA = input[0]
    let numB = input[1]
    
    let listA = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    let listB = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    
    var count = 0
// 브루트 포스
//    for indexA in 0..<listA.count {
//        for indexB in 0..<listB.count {
//            if listA[indexA] <= listB[indexB] { break }
//            count += 1
//        }
//    }

// 이분탐색
    for indexA in 0..<listA.count {
        var left = 0
        var right = listB.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            
            if listA[indexA] <= listB[mid] {
                right = mid - 1
            } else {
                count += mid - left + 1
                left = mid + 1
            }
        }
    }
    
    answer.append(count)
}

answer.forEach { print($0) }
