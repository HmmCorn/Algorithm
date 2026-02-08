func solution(_ str1:String, _ str2:String) -> Int {
    var result = 65536
    let (lhs, rhs) = (parse(str1), parse(str2))
    
    let intersection = getIntersection(lhs, rhs)
    let union = lhs.values.reduce(0, +) + rhs.values.reduce(0, +) - intersection
    
    guard union != 0 else { return 65536 }

    result = Int(Double(intersection) / Double(union) * 65536)

    return result
}

func getIntersection(_ lhs: [String: Int], _ rhs: [String: Int]) -> Int {
    var result = 0
    
    for word in lhs.keys {
        result += min(lhs[word, default: 0], rhs[word, default: 0])
    }
    
    return result
}

func parse(_ str: String) -> [String: Int] {
    var result = [String: Int]()
    let arr = Array(str)

    for i in 0..<str.count - 1 {
        guard arr[i].isLetter && arr[i + 1].isLetter else { continue }
        
        let word = String(arr[i]) + String(arr[i + 1])
        result[word.lowercased(), default: 0] += 1
    }

    return result
}
