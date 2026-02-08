func solution(_ str1: String, _ str2: String) -> Int {
    let jac = jaccard(str1, str2)
    return Int(jac * 65536)
}

// 자카드 유사도
func jaccard(_ s1: String, _ s2: String) -> Double {
    let set1 = makeSet(s1)
    var set2 = makeSet(s2)

    if set1.isEmpty && set2.isEmpty { return 1.0 }

    var intersection: [String] = []
    var unionCount: Int = 0

    for element in set1 {
        if let idx = set2.firstIndex(of: element) {
            intersection.append(element)
            set2.remove(at: idx)
        }
    }

    unionCount = set1.count + set2.count
    return Double(intersection.count) / Double(unionCount)
}

// 집합 만들기
func makeSet(_ string: String) -> [String] {
    let chars = Array(string.lowercased())
    var result: [String] = []

    for i in 0..<chars.count-1 {
        let c1 = chars[i]
        let c2 = chars[i+1]

        if c1.isLetter && c2.isLetter {
            result.append(String([c1, c2]))
        }
    }

    return result
}
