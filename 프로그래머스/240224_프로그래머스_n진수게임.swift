// 240224_프로그래머스_n진수게임
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var number = t * m 
    var textList: [[String]] = []
    
    for number in 0..<number {
        textList.append(String(number, radix: n).uppercased().map { String($0) })
    }
    
    var text = textList.flatMap { $0 }
    var turn = p
    var answer = ""
    
    while true {
        if answer.count == t { break }
        answer.append(text[turn - 1])
        turn += m
    }
    
    return answer
}
