// 240226_프로그래머스_파일명정렬
func solution(_ files:[String]) -> [String] {
    // HEAD, NUMBER, TAIL로 구분
    var sortFile: [[String]] = Array(repeating: Array(repeating: "", count: 3), count: files.count)
    
    for index in 0..<files.count {
        var fileName = files[index].map { String($0) }
        
        var numberingIndex = files[index].count
        var tailIndex = fileName.count
        
        // HEAD
        for textIndex in 0..<fileName.count {
            let text = fileName[textIndex]
            if Int(text) == nil {
                sortFile[index][0] += text
                continue
            }
            
            numberingIndex = textIndex
            break
        }
        
        // NUMBER
        for textIndex in numberingIndex..<fileName.count {
            let text = fileName[textIndex]
            if Int(text) != nil {
                sortFile[index][1] += text
                continue
            }
            
            tailIndex = textIndex
            break
        }
        
        // TAIL
        for textIndex in tailIndex..<fileName.count {
            let text = fileName[textIndex]
            sortFile[index][2] += text
        }
    }
    
    return customSort(file: sortFile).map { $0.joined() }
}

func customSort(file: [[String]]) -> [[String]] {
    return file.sorted { listA, listB in 
        if listA[0].uppercased() == listB[0].uppercased() {
            return Int(listA[1]) ?? 0 < Int(listB[1]) ?? 0
        }
                    
        return listA[0].uppercased() < listB[0].uppercased()
    }
}
