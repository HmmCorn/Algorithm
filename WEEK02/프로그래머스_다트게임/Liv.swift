// 프로그래머스 - 다트게임

func solution(_ dartResult: String) -> Int {
    var result: Int = 0
    var before: Int = 0
    var current: Int = 0
    let dartString = dartResult.replacingOccurrences(of: "10", with: "A")
        
    for char in dartString {
        
        switch char {
        case "D":
            current = current * current
        case "T":
            current = current * current * current
        case "*":
            result += before
            current *= 2
        case "#":
            current *= -1
        case "A":
            result += current
            before = current
            current = 10
        default:
            if char.isNumber,
            let num = Int(String(char)) {
                result += current
                before = current
                current = num
            }
        }
    }
    result += current
    return result
}
