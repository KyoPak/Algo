// 240124_프로그래머스_프로세스.swift
import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    // 우선순위가 큰것부터 빼야한다.
    // location은 0부터 시작
    var sortPrior = priorities.sorted(by: <)
    var indexByPrior: [(Int, Int)] = []
    for index in 0..<priorities.count {
        indexByPrior.append((index, priorities[index]))
    }
    
    var answer = 1
    var firstIndex = 0
    while true {
        if indexByPrior[firstIndex].1 != sortPrior.last! {
            indexByPrior.append(indexByPrior[firstIndex])
            firstIndex += 1
            continue
        }
        
        // 인덱스와 로케이션이 같다면 Break
        if indexByPrior[firstIndex].0 == location {
            break
        }
        
        sortPrior.removeLast()
        firstIndex += 1
        answer += 1
    }
    
    return answer
}
