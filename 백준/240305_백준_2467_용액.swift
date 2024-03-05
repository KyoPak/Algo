// 240305_백준_2467_용액.swift

import Foundation

let line = readLine()!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var left = 0
var right = numbers.count - 1
var values: [Int] = []

var result = abs(numbers[left] + numbers[right])

while left < right {
    let mix = numbers[left] + numbers[right]
    
    if result >= abs(mix) {
        result = abs(mix)
        values = [numbers[left], numbers[right]]
    }
    
    
    if mix > 0 { right -= 1 }
    if mix <= 0 { left += 1 }
}

print(values[0], values[1])
