// 240223_프로그래머스_가장큰정사각형찾기
import Foundation

func solution(_ board:[[Int]]) -> Int {
    var tempBoard = board
    
    for sero in 0..<tempBoard.count {
        for garo in 0..<tempBoard[0].count {
            if tempBoard[sero][garo] == 0 { continue }
            if sero - 1 < 0 || garo - 1 < 0 { continue }
            
            let side = tempBoard[sero - 1][garo - 1]
            let left = tempBoard[sero][garo - 1]
            let up = tempBoard[sero - 1][garo]
            if side != 0 && left != 0 && up != 0 {
                tempBoard[sero][garo] = min(side, left, up) + 1
            }
        }
    }
    
    let length = tempBoard.flatMap { $0 }.max()!
    return length * length
}
