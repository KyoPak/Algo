// 240220_프로그래머스_보석쇼핑.swift
import Foundation

func solution(_ gems:[String]) -> [Int] {
    var gemsCount = Set(gems).count
    
    var left = 0
    var right = 0
    var bags: [String: Int] = [:]
    bags[gems[left]] = 1
    
    var start = 0
    var end = gems.count - 1
    
    while left <= right && left < gems.count && right < gems.count {
        if bags.count < gemsCount {
            right += 1
            if right < gems.count {
                bags[gems[right]] = (bags[gems[right]] ?? 0) + 1
            }
        } else if bags.count == gemsCount {
            if end - start > right - left {
                end = right
                start = left
            }
            
            bags[gems[left]]! -= 1
            if bags[gems[left]] == 0 {
                bags[gems[left]] = nil
            }
            left += 1
        }
    }
    
    return [start + 1, end + 1]
}
