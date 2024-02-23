// 240223_프로그래머스_디펜스게임
// 시간초과 발생 : 78점?
// 우선순위 큐 직접 구현해야 시간초과 발생안한다...

import Foundation

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var current = n
    var list: [Int] = []
    var chance = k
    var maxRound = 0
    if k >= enemy.count { return enemy.count }
    
    for round in 0..<enemy.count {
        if current >= enemy[round] { // 무적권 사용 안해도 괜찮을 때
            var temp = list.last ?? 0
            list.append(enemy[round]) // 무적권 사용안한 것 기록
            
            if temp > enemy[round] { list.sort(by: <) }
            
            current -= enemy[round]
            maxRound = round + 1
            
        } else if chance > 0 {
            // 무적권을 지난 회차에 사용하면 통과할 수 있을 때,
            if !list.isEmpty && current + list.last! >= enemy[round] {
                var temp = list.last ?? 0
                current += list.removeLast()
                current -= enemy[round]
                list.append(enemy[round])
                if temp > enemy[round] { list.sort(by: <) }
            }
            
            chance -= 1 // 무적권 차감(이번 회차, 지난 회차)
            maxRound = round + 1
        } else {
            break
        }
    }
    
    return maxRound
}

// 10, 1, { 2, 2, 2, 2, 10 } / ans : 5
// 3, 1, { 3, 4 } / ans : 2
