// 240318_백준_15686_치킨배달
// 치킨집 M개 제외하고 모두 폐업
// 치킨거리 최솟값

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]

var chicken: [(Int, Int)] = []
var homes: [(Int, Int)] = []
var chickenList: [[Int]] = []

for sero in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    for garo in 0..<line.count {
        if line[garo] == 2 {
            chicken.append((sero, garo))
        }
        
        if line[garo] == 1 {
            homes.append((sero, garo))
        }
    }
}

selectM(temp: [], i: 0)
var minCityChickenDist = Int.max

for list in chickenList {
    var cityChickenDist = 0
    
    for home in homes {
        var minDist = n * n
        for index in list {
            let dist = abs(home.1 - chicken[index].1) + abs(home.0 - chicken[index].0)
            minDist = min(minDist, dist)
        }
        
        cityChickenDist += minDist
    }
    
    minCityChickenDist = min(minCityChickenDist, cityChickenDist)
}

print(minCityChickenDist)

// m개 고르기 : 조합
func selectM(temp: [Int], i: Int) {
    if temp.count == m {
        chickenList.append(temp)
        return
    }
    
    for index in i..<chicken.count {
        var tempList = temp
        tempList.append(index)
        selectM(temp: tempList, i: index + 1)
    }
}
