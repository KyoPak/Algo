import Foundation

func solution(_ s:String) -> [Int] {
    var textArray = s.map { String($0) }
    textArray.removeLast()
    textArray.removeFirst()
    // "{20,111},{111}"	
    
    var texts = textArray.joined().split(separator: "}").map { String($0) }
    // "{20,111},{111}"	
    
    var numbersTexts: [String] = []
    for text in texts {
        var detailText = text.map { String($0) }
        
        detailText.removeFirst()
        if detailText.first! == "{" { detailText.removeFirst() }
        numbersTexts.append(detailText.joined())
    }
    
    // "[20,111] [111]"	
    var numbersArray: [[Int]] = []
    for text in numbersTexts {
        var array: [Int] = []
        var numbers = text.split(separator: ",")    
        for number in numbers {
            array.append(Int(number)!)
        }
        numbersArray.append(array)
    }
    
    numbersArray.sort { $0.count < $1.count }
    
    var answer: [Int] = []
    for numbers in numbersArray {
        for number in numbers {
            if answer.isEmpty || !answer.contains(number) {
                answer.append(number)
            }
        }
    }
    
    return answer
}
