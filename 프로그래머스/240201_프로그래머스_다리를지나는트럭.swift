import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var crossing: [Int] = Array(repeating: 0, count: bridge_length)
    var time = 0
    var currentWeight = 0
    var trucks = truck_weights
    
    while !crossing.isEmpty {
        time += 1
        currentWeight -= crossing.removeFirst()
        
        if !trucks.isEmpty {
            let nextTruck = trucks[0]
            if currentWeight + nextTruck <= weight {
                currentWeight += nextTruck
                crossing.append(nextTruck)
                trucks.removeFirst()
            } else {
                crossing.append(0)
            }   
        }
    }
    
    return time
}
