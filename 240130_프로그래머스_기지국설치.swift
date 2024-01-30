import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    var sortStations = stations
    var endLocation = 0
    
    for index in 0..<sortStations.count {
        let length = (sortStations[index] - w - 1) - (endLocation)
        endLocation = sortStations[index] + w
        
        if length < 0 { continue }
        answer += length / (w + w + 1) + (length % (w + w + 1) != 0 ? 1 : 0)
    }
    
    if endLocation < n {
        let length = n - endLocation
        answer += (length) / (w + w + 1) + (length % (w + w + 1) != 0 ? 1 : 0)
    }

    return answer
}
