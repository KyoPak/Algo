// 240130_프로그래머스_네트워크.swift
import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited: [Int] = Array(repeating: 0, count: n)
    
    var net = 1
    for number in 0..<n {
        var queue: [Int] = [number]
        var queueIndex = 0
        if visited[number] == 0 {
            visited[number] = net
            net += 1
        }
        
        while queueIndex < queue.count {
            let cur = queue[queueIndex]
            queueIndex += 1
            
            for index in 0..<computers[cur].count {
                if visited[index] != 0 { continue }
                if computers[cur][index] == 0 { continue }
                
                queue.append(index)
                visited[index] = visited[cur]
            }
        }
    }
    
    return visited.max()!
}
