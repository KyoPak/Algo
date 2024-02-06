// 240206_백준_톱니바퀴2

// INPUT
var gearCount = Int(readLine()!)!
var gears: [[Int]] = []
for _ in 0..<gearCount {
    let gear = readLine()!.map { Int(String($0))! }
    gears.append(gear)
}

let operCount = Int(readLine()!)!
var opers: [(Int, Int)] = []
for _ in 0..<operCount {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    opers.append((line[0], line[1]))
}

for index in 0..<opers.count {
    let movingStart = opers[index].0 - 1
    let dir = opers[index].1
    var visited: [Bool] = Array(repeating: false, count: gearCount)
    visited[movingStart] = true
    
    // 극이 다르면 반대 방향 회전 .. 1은 시계방향
    var gearQueue: [(Int, Int)] = [(movingStart, dir)]
    var index = 0
    
    // 변경될 큐 리스트
    while index < gearQueue.count {
        let cur = gearQueue[index].0    // Gear Index
        let dir = gearQueue[index].1    // Gear Rotate Direction
        index += 1
        
        if cur + 1 < gearCount && !visited[cur + 1] && gears[cur][2] != gears[cur + 1][6] {
            gearQueue.append((cur + 1, dir * -1))
            visited[cur + 1] = true
        }
        
        if cur - 1 >= 0 && !visited[cur - 1] && gears[cur][6] != gears[cur - 1][2] {
            gearQueue.append((cur - 1, dir * -1))
            visited[cur - 1] = true
        }
    }
    
    for index in 0..<gearQueue.count {
        rotate(gearIndex: gearQueue[index].0, dir: gearQueue[index].1)
    }
}

// OUTPUT
print(gears.filter { $0[0] == 1 }.count)

func rotate(gearIndex: Int, dir: Int) {
    var tempGear = gears[gearIndex]
    // 시계 방향
    if dir == 1 { tempGear.insert(tempGear.removeLast(), at: 0) }
    if dir == -1 {
        tempGear.append(tempGear.removeFirst())
    }
    
    gears[gearIndex] = tempGear
}
