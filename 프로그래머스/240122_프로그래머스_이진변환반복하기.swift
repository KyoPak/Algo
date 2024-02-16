import Foundation

var zero = 0
func solution(_ s:String) -> [Int] {
    var convertCount = 0
    var texts = s.map { String($0) }
    
    while true {
        var numbers = removeZero(texts: texts)
        texts = lengthToBinary(length: numbers.count)
         
        convertCount += 1
        if texts == ["1"] { break }
    }
    
    return [convertCount, zero]
}

func removeZero(texts: [String]) -> [String] {
    var result: [String] = []
    
    for text in texts {
        if text == "0" { continue }
        result.append("1")
    }
    
    zero += texts.count - result.count
    return result
}

func lengthToBinary(length: Int) -> [String] {
    var result: [String] = []
    var number = length
    while number > 0 {
        result.append(String(number % 2))
        number /= 2
    }
    
    result = result.reversed()
    return result
}
