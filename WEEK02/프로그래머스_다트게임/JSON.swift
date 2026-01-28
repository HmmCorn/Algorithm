// 프로그래머스 - 다트게임


func solution(_ dartResult:String) -> Int {
    let dartResult = dartResult
        .replacingOccurrences(of: "10", with: "x")
    var arr = [Int]()
    var idx = -1

    for d in dartResult {
        if d.isNumber {
            arr.append(Int(String(d))!)
            idx += 1
        } else if d == "x" {
            arr.append(10)
            idx += 1
        } else {
            switch d {
            case "S":
                continue
            case "D":
                arr[idx] = arr[idx] * arr[idx]
            case "T":
                arr[idx] = arr[idx] * arr[idx] * arr[idx]
            case "*":
                arr[idx] *= 2
                guard idx > 0 else { break }
                arr[idx - 1] *= 2
            case "#":
                arr[idx] *= -1
            default:
                continue
            }
        }
    }

    return arr.reduce(0, +)
}
