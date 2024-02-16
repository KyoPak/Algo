// 240129_백준_1269_대칭차집합.swift
// 그냥 Dictionary로 풀어도 O(N)가능 

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let listA = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
let listB = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

let aMax = listA.max()!
let bMax = listB.max()!

var answer = 0
for indexA in 0..<listA.count {
    var left = 0
    var right = listB.count - 1
    
    let target = listA[indexA]
    if target > bMax { continue }
    
    while left <= right {
        let midIndex = (left + right) / 2
        
        if listB[midIndex] == target {
            answer += 1
            break
        }
        
        if listB[midIndex] < target {
            left = midIndex + 1
        } else {
            right = midIndex - 1
        }
    }
}

for indexB in 0..<listB.count {
    var left = 0
    var right = listA.count - 1
    
    let target = listB[indexB]
    if target > aMax { continue }
    
    while left <= right {
        let midIndex = (left + right) / 2
        
        if listA[midIndex] == target {
            answer += 1
            break
        }
        
        if listA[midIndex] < target {
            left = midIndex + 1
        } else {
            right = midIndex - 1
        }
    }
}

print(listA.count + listB.count - answer)
