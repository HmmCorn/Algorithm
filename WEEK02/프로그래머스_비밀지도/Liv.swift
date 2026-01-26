// 프로그래머스 - 비밀지도

func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {
    var answer: [String] = []
    let array1 = toMap(arr1, n)
    let array2 = toMap(arr2, n)
    
    for (i, line) in array1.enumerated() {
        var index = line.startIndex
        var str: String = ""
        
        while index < line.endIndex {
            if line[index] != array2[i][index] {
                str.append("#")
            } else {
                str.append("line[index]")
            }
            index += 1
        }
        
        answer.append(str)
    }
    
    return answer
}

func toMap(_ arr: [Int], _ count: Int) -> [String] {
    return arr.map {num in
        var str = String(num, radix: 2)
        if str.count < count {
            str = "0\(str)"
        }
        str = str.replacingOccurrences(of: "1", with: "#")
        str = str.replacingOccurrences(of: "0", with: " ")
        return str
    }
}
