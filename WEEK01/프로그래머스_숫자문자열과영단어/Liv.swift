// 프로그래머스 - 숫자 문자열과 영단어

import Foundation

func solution(_ s:String) -> Int {
    let numberMap: [String: Int] = [
        "one": 1,
        "two": 2,
        "three": 3,
        "four": 4,
        "five": 5,
        "six": 6,
        "seven": 7,
        "eight": 8,
        "nine": 9,
        "zero": 0
    ]

    let numberStrings: [String] = numberMap.keys.map { $0 }.joined(separator: ",")
    
    let filtered = s.replacingOccurrences(
        of: #"[numberStrings]+"#,
        with: "5"
    )
    
    let result: Int = Int(filtered) ?? 0
    return result
}
