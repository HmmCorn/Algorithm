func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache: [String] = []
    var result: Int = 0
    for city in cities {
        let city = city.lowercased()
        
        if cache.contains(city) {
            result += 1
            if let targetIndex = cache.firstIndex(of: city) {
                cache.remove(at: targetIndex)
                cache.append(city)
            }
        } else {
            result += 5
            cache.append(city)
        }
        
        if cache.count > cacheSize {
            cache.removeFirst()
        }
    }
    return result
}
}
