// 프로그래머스 - 캐시

func solution(_ cacheSize: Int, _ cities: [String]) -> Int {
    var totalTime: Int = 0
    var cache: [String] = []
    
    // Cache hit
    func updateCache(_ item: String) {
        if cache.count == cacheSize && cache[cacheSize - 1] == item {
            return
        }
        cache.removeAll(where: { $0 == item })
        addNewItem(item)
    }
    
    // Add item
    func addNewItem(_ item: String) {
        if cache.count == cacheSize {
            cache.removeFirst()
        }
        cache.append(item)
    }
    
    guard cacheSize != 0 else { return cities.count * 5 }
    
    for city in cities {
        let item = city.lowercased()
        if cache.contains(item) {
            totalTime += 1
            updateCache(item)
        } else {
            totalTime += 5
            addNewItem(item)
        }
    }
    
    return totalTime
}
