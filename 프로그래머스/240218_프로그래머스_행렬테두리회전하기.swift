// 240218_프로그래머스_행렬테두리회전하기
import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var board: [[Int]] = []
    for index in 0..<rows {
        var temp: [Int] = []
        for num in 0..<columns {
            temp.append(num + 1 + index * columns)
        }    
        board.append(temp)
    }
    
    var answer: [Int] = []
    for index in 0..<queries.count {
        let startY = queries[index][0] - 1
        let startX = queries[index][1] - 1
        let endY = queries[index][2] - 1
        let endX = queries[index][3] - 1
        
        var rotateList: [Int] = []
        var tempBoard = board
        // 위
        for garo in startX+1..<endX+1 {
            rotateList.append(board[startY][garo])
            tempBoard[startY][garo] = board[startY][garo - 1]
        }
        // 오른쪽
        for sero in startY+1..<endY+1 {
            rotateList.append(board[sero][endX])
            tempBoard[sero][endX] = board[sero - 1][endX]
        }
        // 하단
        for garo in startX..<endX {
            rotateList.append(board[endY][garo])
            tempBoard[endY][garo] = board[endY][garo + 1]
        }
        // 왼
        for sero in startY..<endY {
            rotateList.append(board[sero][startX])
            tempBoard[sero][startX] = board[sero + 1][startX]
        }
        
        board = tempBoard
        answer.append(rotateList.min()!)
    }
    
    return answer
}
