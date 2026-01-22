func solution(_ s: String) -> Int {
    let trans: [String: String] = [
        "zero": "0",
        "one": "1",
        "two": "2",
        "three": "3",
        "four": "4",
        "five": "5",
        "six": "6",
        "seven": "7",
        "eight": "8",
        "nine": "9"
    ]

    var result = ""
    var word = ""

    for char in s {
        // 숫자
        if char >= "0" && char <= "9" {
            result.append(char)
        // 문자
        } else {
            word.append(char)
        }

        if let number = trans[word] {
            result.append(number)
            word = ""
        }
    }

    return Int(result)!
}
