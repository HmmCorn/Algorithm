func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {

    // 10진수 -> 2진수 string 타입 함수 정의
    func toBinaryString(_ num: Int) -> [Character] {
        let binary = String(num, radix: 2)
        // 맨 앞자리가 0일때 처리;;
        return binary
    }

    var result: [String] = []

    for i in 0..<n {
        let binaryArr1 = toBinaryString(arr1[i])
        let binaryArr2 = toBinaryString(arr2[i])

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
