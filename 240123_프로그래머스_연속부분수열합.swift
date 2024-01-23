import Foundation

func solution(_ elements:[Int]) -> Int {
    var newElements = elements + elements
    let total = elements.reduce(0, +)
    var answer: Set<Int> = [total]
    
    var numbers: [Int] = []
    var value = 0
    
    for element in newElements {
        value += element
        numbers.append(value)
    }
    
    for index in 0..<elements.count {
        for index2 in index+1..<index+elements.count {
            answer.insert(numbers[index2] - numbers[index])
        }
    }
    
    return answer.count
}
