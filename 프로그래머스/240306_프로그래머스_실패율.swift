// 240306_프로그래머스_실패율
import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    // 스테이지: 스테이지 시도한 사람 수 
    var all: [Int: Int] = [:]
    
    // 스테이지: 스테이지 통과 못한 사람 수
    var fail: [Int: Int] = [:]
    var sortStages = stages.sorted(by: >)
    
    var next = -1
    for index in 0..<sortStages.count {
        fail[sortStages[index]] = (fail[sortStages[index]] ?? 0) + 1
        
        if index != 0 && next != sortStages[index] {
            all[sortStages[index]] = (all[sortStages[index]] ?? 1) + all[sortStages[index - 1]]!
        } else {
            all[sortStages[index]] = (all[sortStages[index]] ?? 0) + 1
        }
        
        next = sortStages[index]
    }
    
    var failRating: [(Int, Double)] = []
    for stage in 1..<N+1 {
        var rating = 0.0
        if fail[stage] != nil { rating = Double(fail[stage]!) / Double(all[stage]!) }
        
        failRating.append((stage, rating))
    }
    
    failRating.sort {
        if $0.1 == $1.1 { return $0.0 < $1.0 }
        return $1.1 < $0.1
    }
        
    return failRating.map { $0.0 }
}
