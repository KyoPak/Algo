func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cities = cities

    for index in 0..<cities.count {
        cities[index] = cities[index].uppercased()
    }

    var cache: [String] = []
    var answer = 0

    if cacheSize == 0 {
        return 5 * cities.count
    }

    for city in cities {
        if cache.count < cacheSize {
            if !cache.isEmpty && cache.contains(city) { // Cache Hit
                answer += 1    
                let index = cache.firstIndex(of: city)!
                cache.remove(at: index)
            } else {    // Cache Miss
                answer += 5
            }
            
            cache.append(city)
            continue
        }

        if cache.contains(city) { // Cache Hit
            answer += 1    
            let index = cache.firstIndex(of: city)!
            cache.remove(at: index)
        } else { // Cache Miss
            answer += 5
            cache.removeFirst()
        }

        // Cache Update
        cache.append(city)
    }

    return answer
}
