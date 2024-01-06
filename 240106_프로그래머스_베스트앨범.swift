import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dict: [String: Int] = [:]
    for index in 0..<genres.count {
        dict[genres[index]] = (dict[genres[index]] ?? 0) + plays[index]
    }

    var sortedDict = dict.sorted {
        return $0.value > $1.value
    }

    var detail: [[(Int, Int)]] = []
    for item in sortedDict {
        var temp: [(Int, Int)] = []
        for index in 0..<genres.count {
            if genres[index] == item.key {
                temp.append((index, plays[index]))
            }
        }
        detail.append(temp)
    }

    var answer: [Int] = []
    for list in detail {
        var sortedList = list.sorted {
            return $0.1 > $1.1
        }

        if list.count < 2 {
            answer.append(sortedList[0].0)
        } else {
            answer.append(sortedList[0].0)
            answer.append(sortedList[1].0)
        }
    }

    return answer
}
