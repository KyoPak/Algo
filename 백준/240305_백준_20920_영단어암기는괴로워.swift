// 240305_백준_20920_영단어암기는괴로워.swift

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]

var texts: [String: Int] = [:]
for _ in 0..<n {
    let text = readLine()!
    if text.count < m { continue }
    texts[text] = (texts[text] ?? 0) + 1
}

var sortTexts = texts.sorted { textA, textB in    
    if textA.value > textB.value { return true }
    
    if textA.value == textB.value {
        if textA.key.count > textB.key.count { return true }
        
        if textA.key.count == textB.key.count {
            if textA.key < textB.key { return true }
        }
    }
    
    return false
}


sortTexts.forEach { print($0.key) }
