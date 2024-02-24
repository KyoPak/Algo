// 240224_프로그래머스_압축
func solution(_ msg:String) -> [Int] {
    var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
    var dict: [String:Int] = [:]
    
    for index in 0..<alphabet.count {
        dict[alphabet[index]] = index + 1
    }
    
    var texts = msg.map { String($0) }    
    var answer: [Int] = []
    
    var index = 0
    while index < texts.count {
        var continuousText = texts[index]
        var nextIndex = index + 1
        var currentText = continuousText
        
        while nextIndex < texts.count && dict[continuousText] != nil {
            currentText = continuousText
            continuousText += texts[nextIndex]
            nextIndex += 1
        }
        
        if dict[continuousText] != nil { // 인덱스가 초과되서 break 되었을 수 도 있음.
            answer.append(dict[continuousText]!)
            index += continuousText.count    
        } else {
            answer.append(dict[currentText]!)
            dict[continuousText] = dict.count + 1
            index += currentText.count    
        }    
    }

    return answer
}
