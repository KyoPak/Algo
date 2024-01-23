import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    // 누적합 + 투 포인터
    var numbers: [Int] = [0]
    var value = 0
    for num in sequence {
        value += num
        numbers.append(value)
    }
    var answerList: [(Int, Int)] = []
    var right = 0
    var left = 0

    while left <= right {
        if left >= numbers.count || right >= numbers.count { break }
        if numbers[right] - numbers[left] < k {
            right += 1
            continue
        }
        
        if numbers[right] - numbers[left] > k {
            left += 1
            continue
        }
        
        if numbers[right] - numbers[left] == k {
            answerList.append((left, right - 1))
            left += 1
            continue
        }
    }    

    var minDiff = Int.max
    var start = -1
    var last = -1
    for list in answerList {
        if minDiff > list.1 - list.0 {
            minDiff = list.1 - list.0
            start = list.0
            last = list.1
        }
    }
    
    return [start, last]
}
