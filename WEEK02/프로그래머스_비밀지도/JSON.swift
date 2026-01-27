// 프로그래머스 - 비밀지도

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return zip(arr1, arr2).map {
        let row = String($0 | $1, radix: 2)
        let formatted = String(repeating: "0", count: n - row.count) + row
        return formatted
            .map { $0 == "1" ? "#" : " " }
            .joined()
    }
}
