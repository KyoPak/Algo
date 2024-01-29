// 240129_백준_2343_기타레슨.swift

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]    // 강의의 수
let m = input[1]    // 블루레이 갯수

let list = readLine()!.split(separator: " ").map { Int(String($0))! }

// 최소 범위이다. 
// 혹은 "size < list.max()! { return false }" 가 check 메서드 내부에서 필요하다.
var left = list.max()!    
var right = list.reduce(0, +)
var answer = list.reduce(0, +)

while left <= right {
    let size = (left + right) / 2
    
    if check(size: size) {  // 블루레이 크기를 더 줄여도 된다.
        right = size - 1
        answer = min(answer, size)
    } else {
        left = size + 1
    }
}

print(answer)

func check(size: Int) -> Bool {
    var currentSize = size
    var count = 0
    for index in 0..<list.count {
        if currentSize - list[index] < 0 {
            count += 1
            currentSize = size
        }
        
        currentSize -= list[index]
    }
    
    if currentSize != size { count += 1 }
    
    return count <= m
}
