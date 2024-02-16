// 240125_프로그래머스_단어변환
import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var answer = words.count
    var visited: [Bool] = Array(repeating: false, count: words.count)
    
    if !words.contains(target) { return 0 }
    
    func dfs(start: String, count: Int) { 
        if start == target {
            answer = min(answer, count)
            return
        }
        
        for i in 0..<words.count {
            if visited[i] { continue }
            if !diffOne(textA: start, textB: words[i]) { continue }
            visited[i] = true
            dfs(start: words[i], count: count + 1)
            visited[i] = false
        }
    }
    
    dfs(start: begin, count: 0)
    
    return answer
}

func diffOne(textA: String, textB: String) -> Bool {
    let textsA = textA.map { String($0) }
    let textsB = textB.map { String($0) }
    var diff = 0
    for index in 0..<textsA.count {
        if diff > 1 { return false }
        if textsA[index] != textsB[index] {
            diff += 1
        }
    }
    
    return diff == 1 ? true : false
}
