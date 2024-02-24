import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var board = data.sorted { listA, listB in
        if listA[col - 1] == listB[col - 1] {
            return listA[0] > listB[0]
        }
        return listA[col - 1] < listB[col - 1]
    }
    
    var number: [Int] = []
    for index in row_begin-1..<row_end {
        let mod = index + 1
        var num = 0
        for target in board[index] {
            num += target % mod
        }
        number.append(num)
    }
    
    var current = 0
    
    for index in 0..<number.count {
        current ^= number[index]   
    }
    
    return current
}
