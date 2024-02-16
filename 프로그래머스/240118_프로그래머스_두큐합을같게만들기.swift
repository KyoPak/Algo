// 240118_프로그래머스_두큐합을같게만들기
import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var que1 = queue1
    var que2 = queue2
    var sumA = queue1.reduce(0, +)
    var sumB = queue2.reduce(0, +)
    
    let totalSum = sumA + sumB
    if totalSum % 2 == 1 { return -1 }
    
    var count = 0
    var indexA = 0
    var indexB = 0
    while sumA != sumB {
        if count > (queue1.count + queue2.count) * 2 { return -1 }
        
        if sumA > sumB {
            var moveNum = que1[indexA]
            sumA -= moveNum
            sumB += moveNum
            que2.append(moveNum)
            indexA += 1
            count += 1
            continue
        }
        
        if sumA < sumB {
            var moveNum = que2[indexB]
            sumB -= moveNum
            sumA += moveNum
            que1.append(moveNum)
            indexB += 1
            count += 1
            continue
        }
    }
    
    return count
}
