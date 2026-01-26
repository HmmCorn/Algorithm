func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {

    // 10진수 -> 2진수 함수 정의
    func toBinaryArray(_ num: Int) -> [Character] {
        let binary = String(num, radix: 2)
        let padded = String(repeating: "0", count: n - binary.count) + binary
        return Array(padded)
    }

    var result: [String] = []

    for i in 0..<n {
        let binaryArr1 = toBinaryArray(arr1[i])
        let binaryArr2 = toBinaryArray(arr2[i])

        var line = ""

        for j in 0..<n {
            if binaryArr1[j] == "1" || binaryArr2[j] == "1" {
                line.append("#")
            } else {
                line.append(" ")
            }
        }

        result.append(line)
    }

    return result
}
