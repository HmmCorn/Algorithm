// 프로그래머스 - 뉴스 클러스터링

func solution(_ str1: String, _ str2: String) -> Int {
    var arr1: [String] = toSplit(str1.lowercased())
    var arr2: [String] = toSplit(str2.lowercased())
    
    var intersection: Int = 0
    
    if arr1.isEmpty, arr2.isEmpty { return 65536 }

    for item in arr1 {
        if let idx = arr2.firstIndex(of: item) {
            intersection += 1
            arr2.remove(at: idx)
        }
    }

    let union = arr1.count + arr2.count
    return intersection * 65536 / union
}

func toSplit(_ str: String) -> [String] {
    var string = str
    var result: [String] = []
    while !string.isEmpty {
        var item: String = String(string.prefix(2))
        item.removeAll { !$0.isLetter }
        if !item.isEmpty, item.count == 2 {
            result.append(item)
        }
        string.removeFirst()
    }
    return result
}
