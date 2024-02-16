// 240108_1644_소수의연속합

var number = Int(readLine()!)!

// false 면 소수 X
var primeNumbers: [Bool] = Array(repeating: true, count: number + 1)
primeNumbers[1] = false

if number == 1 {
    print(0)
} else {
    eratos()
    let list = getPrime(number: number)
    var start = 0
    var end = 0
    var sum = list[0]
    var answer = 0
    
    while start <= end {
        if sum < number {
            end += 1
            sum += list[end]
        }
        
        if sum > number {
            sum -= list[start]
            start += 1
        }
        
        if sum == number {
            answer += 1
            sum -= list[start]
            start += 1
        }
        
        if end == list.count - 1 || start == list.count - 1 { break }
    }
    
    print(answer)
}

// 소수
func eratos() {
    for i in 2..<number+1/2 {
        for j in stride(from: i * i, through: number, by: i) {
            if primeNumbers[j] == false { continue }
            primeNumbers[j] = false
        }
    }
}

func getPrime(number: Int) -> [Int] {
    if number <= 1 { return [] }
    
    var result: [Int] = []
    for i in 2..<number + 1 {
        if primeNumbers[i] {
            result.append(i)
        }
    }
    
    return result
}

