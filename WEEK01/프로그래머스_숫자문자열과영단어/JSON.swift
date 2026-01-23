import Foundation

func solution(_ s:String) -> Int {
    var result = s
    let numDict = [
        "zero": 0,
        "one": 1,
        "two": 2,
        "three": 3,
        "four": 4,
        "five": 5,
        "six": 6,
        "seven": 7,
        "eight": 8,
        "nine": 9
    ]

    numDict.keys.forEach {
        result = result.replacingOccurrences(of: $0, with: String(numDict[$0]!))
    }

    return Int(result)!
}
