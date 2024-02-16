// 240216_백준_14888_연산자끼워넣기

// + - * / 갯수가 정해져있다.
let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let operators = readLine()!.split(separator: " ").map { Int(String($0))! }

var maxValue = Int.min
var minValue = Int.max

recursive(result: numbers[0], nums: [numbers[0]], index: 1, opers: operators)
print(maxValue)
print(minValue)

// 최댓값 최솟값 구해야한다.
func recursive(result: Int, nums: [Int], index: Int, opers: [Int]) {
    if nums.count == n {
        maxValue = max(maxValue, result)
        minValue = min(minValue, result)
        return
    }
    
    var temp = nums
    temp.append(numbers[index])
    
    var tempOpers = opers
    
    for operIndex in 0..<4 {
        if tempOpers[operIndex] == 0 { continue }
        tempOpers[operIndex] -= 1
        switch operIndex {
        case 0:
            recursive(result: result + numbers[index], nums: temp, index: index + 1, opers: tempOpers)
        case 1:
            recursive(result: result - numbers[index], nums: temp, index: index + 1, opers: tempOpers)
        case 2:
            recursive(result: result * numbers[index], nums: temp, index: index + 1, opers: tempOpers)
        case 3:
            recursive(result: result / numbers[index], nums: temp, index: index + 1, opers: tempOpers)
        default: break
        }
        tempOpers[operIndex] += 1
    }
}
