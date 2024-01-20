import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var newTimes: [[Int]] = []
    
    for time in book_time {
        let newTime = convert(stringTime: time)
        newTimes.append(newTime)
    }
    
    newTimes.sort { 
        if $0[0] == $1[0] { return $0[1] < $1[1] }
        return $0[0] < $1[0] // 입실 시간으로 오름차순 정렬 
    }
    
    var rooms: [Int] = [-1] // 끝나는 시간
    for index in 0..<newTimes.count {
        let nextStart = newTimes[index][0]
        let nextEnd = newTimes[index][1]
        
        // 가장 퇴실이 빠른 방의 퇴실 시간보다 입실 시간이 늦은 경우
        if rooms.last! <= nextStart {
            rooms.removeLast()
        }
        
        rooms.append(nextEnd)
        
        // 퇴실 시간 내림차순
        rooms.sort {
            return $0 > $1
        }
    }
    
    return rooms.count
}

// 시:분 ➡️ 분으로 변경
func convert(stringTime: [String]) -> [Int] {
    let start = stringTime[0].split(separator: ":").map { Int(String($0))! }
    let end = stringTime[1].split(separator: ":").map { Int(String($0))! }
    let startTime = (start[0] * 60) + start[1]
    let endTime = (end[0] * 60) + end[1] + 10
    
    return [startTime, endTime]
}
