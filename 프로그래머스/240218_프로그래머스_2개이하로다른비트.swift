// 240218_프로그래머스_2개이하로다른비트

// 첫번째 풀이 : number ^ targetNumber 해서 한개씩 비교하면 시간초과 발생.

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var answer: [Int64] = []
    for index in 0..<numbers.count {
        var number = numbers[index]

      // 짝수일 경우에는 1만 더해주면 최소
        if number % 2 == 0 {
            answer.append(Int64(number + 1))
            continue
        }

      // 홀수 일 경우, 1011 -> 1101 / 0111 -> 1011 : reverse 후 0이 최초로 나오면 1로 바꿔주고 그 전 인덱스 0으로 
        if number % 2 == 1 {
            var bin = String(number, radix: 2).reversed().map { String($0) }
            bin.append("0")
            var targetNumber = number
            var divideValue = 1
            for index in 0..<bin.count {
                if bin[index] == "0" {
                    targetNumber += Int64(divideValue)
                    targetNumber -= Int64(divideValue/2)
                    break
                }  
                
                divideValue *= 2
            } 
            
            answer.append(Int64(targetNumber))
        }
    }
    
    return answer
}
