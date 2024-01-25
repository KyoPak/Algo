// 240125_백준_9935_문자열폭발

let text = readLine()!.map { String($0) }
let bomb = readLine()!.map { String($0) }

var result: [String] = []

for index in 0..<text.count {
    result.append(text[index])
    
    if result.count >= bomb.count && result.last! == bomb.last! {
        let start = result.count - bomb.count
        
        if result[start..<result.count].joined() == bomb.joined() {
            for _ in 0..<bomb.count {
                result.removeLast()
            }
        }
    }
}

let answer = result.joined()
print(answer == "" ? "FRULA" : answer)
