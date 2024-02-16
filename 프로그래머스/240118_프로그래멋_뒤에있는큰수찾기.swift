import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var maxNumber = 1_000_001
    var bigNumber: [Int] = [maxNumber]
    var answer: [Int] = []
    var reverseNumbers = numbers.reversed()
    
    for number in reverseNumbers {
        while bigNumber.last! <= number { 
            bigNumber.removeLast()
        }
        
        answer.append(bigNumber.last! == maxNumber ? -1 : bigNumber.last!)
        bigNumber.append(number)
    }
    
    return answer.reversed()
}
