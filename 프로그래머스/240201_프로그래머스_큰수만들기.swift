import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var stack: [String] = []
    var removeCount = k
    
    for num in number {
        while removeCount > 0 && !stack.isEmpty && stack.last! < String(num) {
            stack.removeLast()
            removeCount -= 1
        }
        stack.append(String(num))
    }
    
    // k개를 모두 제거하지 않았다면 남은 개수만큼 뒤에서 제거
    while removeCount > 0 {
        stack.removeLast()
        removeCount -= 1
    }

    return stack.joined()
}

// 아래 풀이 2가지 case에서 시간초과 발생
func solution(_ number:String, _ k:Int) -> String {
    var numbers = number.map { Int(String($0))! }
    var result: [String] = []
    var count = 0
    var start = 0
    var end = k + 1
    
    while count < numbers.count - k {
        if end - start == 1 { break }
        
        let list = numbers[start..<end].map { $0 }
        let maxNumber = list.max()!
        var maxIndex = start + list.firstIndex(of: maxNumber)!
        
        result.append(String(numbers[maxIndex]))
        count += 1
        start = maxIndex + 1
        end += 1
    }

    if end - start == 1 {
        result += numbers[start..<numbers.count].map { String($0) }
    }

    var answer = result.joined()
    return answer
}
