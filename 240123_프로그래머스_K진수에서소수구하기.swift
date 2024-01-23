import Foundation

var prime: [Bool] = Array(repeating: true, count: 1000001)
func solution(_ n:Int, _ k:Int) -> Int {
    var binary = String(n, radix: k)    
    var numbers: [Int] = binary.split(separator: "0").filter { Int($0) != nil }.map { Int(String($0))! }
    
    var answer = 0
    for number in numbers {
        if isPrime(n: number) { answer += 1 }
    }
    
    return answer
}

func isPrime(n: Int) -> Bool {
    if n == 1 { return false }
    
    for value in 2..<n {
        if value > Int(sqrt(Double(n))) { break }
        if n % value == 0 { return false }
    }
    
    return true
}
