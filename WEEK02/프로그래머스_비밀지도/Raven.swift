func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    for (num1, num2) in zip(arr1, arr2) {
        var num1String = toBinaryString(length: n, num: num1)
        var num2String = toBinaryString(length: n, num: num2)
        var sumMap: String = ""

        for (num1Char, num2Char) in zip(num1String, num2String) {
            if num1Char == "0" && num2Char == "0" {
                sumMap.append(" ")
            } else {
                sumMap.append("#")
            }
        }
        answer.append(sumMap)
    }
    return answer
}

func toBinaryString(length: Int, num: Int) -> String {
    var transNum = String(num, radix: 2)
    if transNum.count < length {
        let prefixString = String(repeating: "0", count: length - transNum.count)
        transNum = prefixString + transNum
    }
    return transNum
}
