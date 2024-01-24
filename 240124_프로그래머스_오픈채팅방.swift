import Foundation

func solution(_ record:[String]) -> [String] {
    var answer: [String] = []
    var history: [String] = []
    var userID: [String] = []
    var dict: [String: String] = [:] // userID: nickName
    
    for index in 0..<record.count {
        var info = record[index].split(separator: " ").map { String($0) }
        
        switch info[0] {
            case "Enter":
                history.append("들어왔습니다.")
                userID.append(info[1])
                dict[info[1]] = info[2]
            case "Leave":
                history.append("나갔습니다.")
                userID.append(info[1])
            case "Change":
                dict[info[1]] = info[2]
            default: continue
        }
    }
    
    for index in 0..<history.count {
        let id = userID[index]
        var text = dict[id]! + "님이" + " " + history[index]
        answer.append(text)
    }
    
    return answer
}
