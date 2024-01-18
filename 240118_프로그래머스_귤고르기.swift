import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var type: [Int: Int] = [:] // Size: Value
    
    for size in tangerine { 
        type[size] = (type[size] ?? 0) + 1
    }
    
    var sortType = type.sorted {
        $0.value > $1.value
    }
    
    var k = k 
    var count = 0
    for item in sortType {
        count += 1
        k -= item.value 
        
        if k <= 0 { break }
    }
    
    return count
}
