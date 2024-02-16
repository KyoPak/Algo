import Foundation

func solution(_ dirs:String) -> Int {
    
    var startY = 0
    var startX = 0
    var dist: [[Int]] = []
    
    for dir in dirs { 
        var ny = startY
        var nx = startX
        switch dir {
            case "U":   ny = startY + 1
            case "D":   ny = startY - 1
            case "R":   nx = startX + 1
            case "L":   nx = startX - 1
            default:    continue
        }
        
        if ny < -5 || nx < -5 || ny > 5 || nx > 5 { continue }
        
        // 역방향도 고려
        if !dist.contains([startY, startX, ny, nx]) && !dist.contains([ny, nx, startY, startX]) { 
            dist.append([startY, startX, ny, nx])
        }
        
        startY = ny
        startX = nx
    }
    
    return dist.count
}
