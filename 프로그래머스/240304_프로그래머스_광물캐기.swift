import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var minResult = Int.max
    
    var pickCost: [String: [Int]] = [
        "diamond": [1, 5, 25],
        "iron": [1, 1, 5],
        "stone": [1, 1, 1]
    ]
    
    func dfs(picks: [Int], cost: Int, mineralIndex: Int) {
        
        if mineralIndex == minerals.count || picks.max()! == 0 { 
            minResult = min(cost, minResult)
            return
        }
        
        for index in 0..<picks.count {
            if picks[index] <= 0 { continue }
            var newPicks = picks
            newPicks[index] -= 1 
            
            var currentCost = cost
            var mineralIndex = mineralIndex
            for _ in 0..<5 {
                if mineralIndex >= minerals.count { break }
                currentCost += pickCost[minerals[mineralIndex]]![index]
                mineralIndex += 1
            }
            
            dfs(picks: newPicks, cost: currentCost, mineralIndex: mineralIndex)
            newPicks[index] += 1
        }   
    }
    
    dfs(picks: picks, cost: 0, mineralIndex: 0)
    
    return minResult
}
