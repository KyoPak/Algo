// 240130_백준_2776_암기왕

// 수첩2에 있는 숫자가 수첩 1에 있으면 1, 없으면 0
// N은 1_000_000범위 - 빠른 입출력 사용해야한다.
let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let numA = Int(readLine()!)!
    let listA = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
    
    let numB = Int(readLine()!)!
    let listB = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var result: [Int] = []
    for index in 0..<listB.count {
        let target = listB[index]
            
        var left = 0
        var right = numA - 1
        var containFlag = false
        while left <= right {
            let mid = (left + right) / 2
            
            if listA[mid] == target {   // 수첩1에 있다면
                containFlag = true
                break
            } else if listA[mid] < target {
                left = mid + 1
            } else if listA[mid] > target {
                right = mid - 1
            }
        }
        
        result.append(containFlag ? 1 : 0)
    }
    
    result.forEach { print($0) }
}
