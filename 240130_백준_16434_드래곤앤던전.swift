// 240130_백준_16434_드래곤앤던전

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]    // 방 수
let heroAtk = input[1]  // 용사 공격력

var rooms: [(Int, Int, Int)] = []

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    rooms.append((line[0], line[1], line[2]))
}

var left = 1
var right = Int.max - 1
var answer = 0

while left <= right {
    let mid = (left + right) / 2
    
    if check(hp: mid) {
        right = mid - 1
        answer = mid
    } else {
        left = mid + 1
    }
}

print(answer)

func check(hp: Int) -> Bool {
    var atk = heroAtk
    
    var currentHP = hp
    for index in 0..<rooms.count {
        let type = rooms[index].0
        
        switch type {
        case 2:
            atk += rooms[index].1
            currentHP = currentHP + rooms[index].2 > hp ? hp : currentHP + rooms[index].2
        case 1:
            // 히어로가 때려야하는 횟수 : 17
            let heroCnt = (rooms[index].2 / atk) + (rooms[index].2 % atk != 0 ? 1 : 0)
            
            // 히어로가 먼저 때린다고 가정.
            currentHP -= (heroCnt - 1) * rooms[index].1 // 히어로가 때린만큼 몬스터 공격력만큼 맞는다.
            if currentHP <= 0 { return false }
        default: continue
        }
    }
    
    return true
}
