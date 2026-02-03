/*
1차 실패
- let city = city.lowercased() 이거 안적음 (시간부족했음)
*/

func solution(_ cacheSize: Int, _ cities: [String]) -> Int {
    var cache: [String] = [""]
    var time: Int = 0

    for city in cities {
        if cache.contains(city) {
            time += 1
            cache.removeAll { $0 == city }
            cache.append(city)
        } else {
            time += 5
            if cache.count == cacheSize {
                cache.removeFirst()
            }
            cache.append(city)
        }
    }

    return time
}

/*
2차 실패
- 몇개 테스트 케이스가 실패함
- 이유를 찾아보니 cacheSize가 0일 때, for문의 첫번째 eles는 통과하지만 두번째 if cache.contains(city) 에서 true가 나와서 틀리게됨 (cacheSize == 0 일 때, if 문의 true가 나오면 안됨)
*/


func solution(_ cacheSize: Int, _ cities: [String]) -> Int {

    var cache: [String] = [""]
    var time: Int = 0

    for city in cities {
        let city = city.lowercased()

        if cache.contains(city) {
            time += 1
            cache.removeAll { $0 == city }
            cache.append(city)
        } else {
            time += 5
            if cache.count == cacheSize {
                cache.removeFirst()
            }
            cache.append(city)
        }
    }

    return time
}


/*
3차 성공
- 그래서 0일 경우 전처리하면됨
- var cache의 초기값에 ""를 넣어놨는데, 이 필요도 없음
  - for문의 첫번째에서 cacheSize==0일 때 cache.removeFirst()를 하면 안돼서 넣어뒀었음
*/


func solution(_ cacheSize: Int, _ cities: [String]) -> Int {
    if cacheSize == 0 { return cities.count * 5 }

    var cache: [String] = [""]
    var time: Int = 0

    for city in cities {
        let city = city.lowercased()

        if cache.contains(city) {
            time += 1
            cache.removeAll { $0 == city }
            cache.append(city)
        } else {
            time += 5
            if cache.count == cacheSize {
                cache.removeFirst()
            }
            cache.append(city)
        }
    }

    return time
}
