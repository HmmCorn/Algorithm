// 프로그래머스 - 비밀지도

func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {
    var answer: [String] = []
    let array1 = toMap(arr1, n)
    let array2 = toMap(arr2, n)
    
    for (i, line) in array1.enumerated() {
        var str: String = ""
        
        for (first, second) in zip(line, array2[i]) {
            str.append(first == second ? (first == "1" ? "#" : " ") : "#")
        }
        
        answer.append(str)
    }
    
    return answer
}

func toMap(_ arr: [Int], _ count: Int) -> [String] {
    return arr.map {num in
        var str = String(num, radix: 2)
        str = String(repeating: "0", count: count - str.count) + str
        return str
    }
}
