// 240119_프로그래머스_피로도.swift
import Foundation

var allCase: [[Int]] = []
var visited: [Bool] = Array(repeating: false, count: 8)

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    findAllCase(total: dungeons.count, temp: [])
    
    var maxPlay = 0
    for playCase in allCase {
        var tire = k
        var play = 0
        for index in playCase {
            if tire < dungeons[index][0] { break }
            tire -= dungeons[index][1]
            play += 1
        }
        
        maxPlay = max(maxPlay, play)
    }
    
    return maxPlay
}

// 순열
func findAllCase(total: Int, temp: [Int]) {
    if temp.count == total {
        allCase.append(temp)
        return
    }
    
    for index in 0..<total {
        if visited[index] { continue }
        
        visited[index] = true
        var temp = temp
        temp.append(index)
        findAllCase(total: total, temp: temp)
        visited[index] = false
    }
}
