// 240201_백준_14891_톱니바퀴

// 극이 같으면 회전안한다.
// 회전할 경우, 한쪽이 시계방향회전하면 양쪽은 반시계방향회전한다.

var gears: [[Int]] = []

for _ in 0..<4 {
    let gear: [Int] = readLine()!.map { Int(String($0))! }
    gears.append(gear)
}

var operCase = Int(readLine()!)!
var opers: [(Int, Int)] = [] // (회전 시키는 톱니바퀴 번호, 방향)
for _ in 0..<operCase {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    opers.append((input[0], input[1]))
}

for index in 0..<operCase {
    // 회전시킬 톱니번호와 방향
    var rotateList: [(Int, Int)] = [(opers[index].0 - 1, opers[index].1)]
    var rotateIndex = 0
    
    var visited: [Bool] = [false, false, false, false]
    visited[opers[index].0 - 1] = true
    
    // 극이 다르면 회전한다.
    while rotateIndex < rotateList.count {
        let cur = rotateList[rotateIndex]
        let number = cur.0 // 현재 돌릴 예정인 톱니
        let dir = cur.1
        rotateIndex += 1
        let next = number + 1
        let prev = number - 1
        if next < 4 && !visited[next] && gears[number][2] != gears[next][6] {
            rotateList.append((next, dir * -1)) // 돌릴 리스트에 추가
            visited[next] = true
        }
        
        if prev >= 0 && !visited[prev] && gears[number][6] != gears[prev][2] {
            rotateList.append((prev, dir * -1)) // 돌릴 리스트에 추가
            visited[prev] = true
        }
    }
    
    for list in rotateList {
        let moveGear = gears[list.0]
        let dir = list.1
        let newGear = rotate(gear: moveGear, dir: dir)
        gears[list.0] = newGear
    }
}

var score = 0
for index in 0..<4 {
    if gears[index].first! == 1 {
        if index == 0 { score += 1 }
        if index == 1 { score += 2 }
        if index == 2 { score += 4 }
        if index == 3 { score += 8 }
    }
}

print(score)


func rotate(gear: [Int], dir: Int) -> [Int] {
    var moveGear = gear
    if dir == 1 { // 시계 방향 회전
        let moveTarget = moveGear.removeLast()
        moveGear.insert(moveTarget, at: 0)
    } else {
        let moveTarget = moveGear.removeFirst()
        moveGear.append(moveTarget)
    }
    
    return moveGear
}
