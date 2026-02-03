// 첫 시도
// 실패 이유: isFull 부등호 반대로 함; + cacheSize가 0일 때 서브스크립트 -> 에러
// 배운점: core dump를 피하기 위해서 서브스크립트, 옵서널 강제 언래핑 쓰지말자.
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var result = 0
    var cache = [String]()
    var cacheSet = Set<String>()
    
    for city in cities {
        let city = city.lowercased()
        let (isFull, isHit) = (cache.count >= cacheSize, cacheSet.contains(city))
        
        switch (isFull, isHit) {
        case (false, false):
            result += 5
            cache.append(city)
            cacheSet.insert(city)
        case (false, true):
            result += 1
            cache.removeAll { $0 == city }
            cache.append(city)
            cacheSet.insert(city)
        case (true, false):
            result += 5
            let oldCity = cache[0]
            cache.removeFirst()
            cache.append(city)
            cacheSet.insert(city)
            cacheSet.remove(oldCity)
        case (true, true):
            result += 1
            let idx = cache.firstIndex(of: city)!
            cache.removeFirst(idx)
            cache.removeAll { $0 == city }
            cache.append(city)
        }
    }
    return 
  result
}

// 두 번째 시도
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache = [String]()
    var result = 0

    guard cacheSize > 0 else { return cities.count * 5 }
    
    for city in cities {
        let city = city.lowercased()
        
        if cache.contains(city) {
            if let index = cache.firstIndex(of: city) {
                cache.remove(at: index)
            }
            result += 1
        } else {
            if cache.count == cacheSize {
                cache.removeFirst()
            }
            result += 5
        }

        cache.append(city)
    }

    return result
}
