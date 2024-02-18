// 240218_프로그래머스_택배상자
import Foundation

func solution(_ order:[Int]) -> Int {
    var count = 0
    var number = 1
    var stack: [Int] = []
    
    for index in 0..<order.count {
        while number <= order[index]  {
            stack.append(number)
            number += 1
        }
        
        if stack.last! == order[index] {
            stack.removeLast()
            count += 1
            continue
        }
        
        break 
    }
    
    return count
}


func solution(_ order:[Int]) -> Int {

    var numbers: [Int] = []
    for index in 0..<order.count {
        numbers.append(index + 1)
    }

    var count = 0
    var orderIndex = 0
    var numberIndex = 0
    var stack: [Int] = []
    while true {
        if numberIndex < numbers.count && order[orderIndex] == numbers[numberIndex] {
            orderIndex += 1
            numberIndex += 1
            count += 1
            continue
        } else if !stack.isEmpty && stack.last! == order[orderIndex] {
            stack.removeLast()
            orderIndex += 1
            count += 1
            continue
        } else if numberIndex < numbers.count {
            stack.append(numbers[numberIndex])
            numberIndex += 1
            continue
        }

        break
    }

    return count
}
