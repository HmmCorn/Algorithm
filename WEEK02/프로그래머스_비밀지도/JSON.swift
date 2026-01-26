// 프로그래머스 - 비밀지도

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return zip(arr1, arr2).map {
        let row = String($0 | $1, radix: 2)
        let formatted = String(format: "%0\(n)d", Int(row)!)
        return formatted
            .map { $0 == "1" ? "#" : " " }
            .joined()
    }
}
