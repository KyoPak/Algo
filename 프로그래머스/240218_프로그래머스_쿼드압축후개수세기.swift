// 240218_프로그래머스_쿼드압축후개수세기
import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    
    var answer: [Int] = []
    
    func recursive(startX: Int, startY: Int, endX: Int, endY: Int, length: Int) {
        let result = check(board: arr, startX: startX, startY: startY, endX: endX, endY: endY)
        if result == -1 {
            var half = length / 2
            recursive(startX: startX, startY: startY, endX: startX + half, endY: startY + half, length: half)
            recursive(startX: startX + half, startY: startY, endX: endX, endY: startY + half, length: half)
            recursive(startX: startX, startY: startY + half, endX: startX + half, endY: endY, length: half)
            recursive(startX: startX + half, startY: startY + half, endX: endX, endY: endY, length: half)
        } else {
            answer.append(result)
        }
    }   
    
    recursive(startX: 0, startY: 0, endX: arr.count, endY: arr.count, length: arr.count)
    return [answer.filter { $0 == 0 }.count, answer.filter { $0 == 1 }.count]
}

func check(board: [[Int]], startX: Int, startY: Int, endX: Int, endY: Int) -> Int {
    var one = 0 
    var zero = 0
    for sero in startY..<endY {
        for garo in startX..<endX {
            if board[sero][garo] == 1 {
                one += 1  
            } else {
                zero += 1
            }
        }
    }
    
    if one != 0 && zero == 0 { return 1 }
    if zero != 0 && one == 0 { return 0 }
    return -1
}
