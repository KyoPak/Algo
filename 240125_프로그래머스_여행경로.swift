// 240125_프로그래머스_여행경로
import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var sortTickets = tickets.sorted {
        if $0[0] == $1[0] { return $0[1] < $1[1] }
        return $0[0] < $1[0]
    }
    
    var answer: [String] = []
    var visited: [Bool] = Array(repeating: false, count: sortTickets.count)
    
    func dfs(start: String, list: [String]) {
        if list.count == tickets.count + 1 {
            if answer == [] { answer = list }
            return
        }
        
        for index in 0..<sortTickets.count {
            if visited[index] { continue }
            if start != sortTickets[index][0] { continue }
            
            visited[index] = true
            var temp = list
            temp.append(sortTickets[index][1])
            dfs(start: sortTickets[index][1], list: temp)
            visited[index] = false
        }
    }
    
    dfs(start: "ICN", list: ["ICN"])
    
    return answer
}

