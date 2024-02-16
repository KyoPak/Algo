import Foundation

func solution(_ numbers:String) -> Int {
    var sortNumbers = numbers.sorted(by: >).map { String($0) }
    var maxNumbers = Int(sortNumbers.map { String($0) }.joined())!
    var prime = eratos(count: maxNumbers)
    
    var answer = 0
    for number in 0..<maxNumbers+1 {
        if prime[number] && make(target: sortNumbers, number: number) { 
            answer += 1 
        }
    }
    
    return answer
}

func make(target: [String], number: Int) -> Bool {
    var numbers = String(number).sorted(by: >).map { String($0) }
    var sortTarget = target
    
    var index = sortTarget.count - 1
    while true {
        if index == -1 { break }
        if numbers.isEmpty { break }
        
        if sortTarget[index] == numbers.last! {
            sortTarget.removeLast()
            numbers.removeLast()
        } 
        
        index -= 1
    }
    return numbers.isEmpty ? true : false
}

func eratos(count: Int) -> [Bool] {
    var prime: [Bool] = Array(repeating: true, count: count + 1)
    prime[0] = false
    prime[1] = false
    
    for i in 2..<Int(sqrt(Double(prime.count))) + 1 {
        if prime[i] == false { continue }
        
        var j = i * i
        while j < prime.count {
            prime[j] = false
            j += i
        }
    }
    
    return prime
}
