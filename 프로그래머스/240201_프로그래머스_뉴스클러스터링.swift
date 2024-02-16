// 240201_프로그래머스_뉴스클러스터링
func solution(_ str1:String, _ str2:String) -> Int {
    // 자카드 유사도 = 교집합 갯수 / 합집합 갯수
    // 65536 곱하고 소수점 아래 버린다.
    let textA: [String] = convertTwoWord(text: str1)
    let textB: [String] = convertTwoWord(text: str2)
    let interSactionTexts = interSaction(textA: textA, textB: textB)
    let multipleTexts = multiple(textA: textA, textB: textB, interSaction: interSactionTexts)
    
    if interSactionTexts.count == 0 && multipleTexts.count == 0 { return 65536 }
    // if interSactionTexts.count == 0 && multipleTexts.count != 0 { return 0 }
    
    return Int(Double(interSactionTexts.count * 65536) / Double(multipleTexts.count))
}

func multiple(textA: [String], textB: [String], interSaction: [String]) -> [String] {
    var result: [String] = []
    for text in textA { result.append(text) }
    for text in textB { result.append(text) }
    for text in interSaction {
        let index = result.firstIndex(of: text)!
        result.remove(at: index)
    }
    
    return result
}

func interSaction(textA: [String], textB: [String]) -> [String] {
    var dict: [String: Int] = [:]
    var result: [String] = []
    for text in textA {
        dict[text] = (dict[text] ?? 0) + 1
    }
    
    for text in textB {
        if dict[text] == nil || dict[text]! == 0 { continue }
        dict[text]! -= 1
        result.append(text)
    }
    
    return result
}

func convertTwoWord(text: String) -> [String] {
    let alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let texts = text.uppercased().map { String($0) }
    var words: [String] = []
    var word = ""
    
    for index in 0..<texts.count {
        if !alpha.contains(texts[index]) { 
            word = ""
            continue 
        }
     
        word += texts[index]
        if word.count == 2 {
            words.append(word)
            word = texts[index]
        }
    }
    
    return words
}
