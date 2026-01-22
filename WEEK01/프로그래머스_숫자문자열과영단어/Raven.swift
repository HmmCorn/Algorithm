import Foundation

// func solution(_ s: String) -> Int {
//     let numberWordMap: [String: String] = [
//         "zero": "0",
//         "one": "1",
//         "two": "2",
//         "three": "3",
//         "four": "4",
//         "five": "5",
//         "six": "6",
//         "seven": "7",
//         "eight": "8",
//         "nine": "9"
//     ]
    
//     var currentWord = ""
//     var result = ""
    
//     for character in s {
//         if character.isNumber {
//             result += String(character)
//         } else {
//             currentWord += String(character)
//             guard let digit = numberWordMap[currentWord] else { continue }
//             result += digit
//             currentWord = ""
//         }
//     }
    
//     return Int(result) ?? -1
// }

func solution(_ s: String) -> Int {
    let numberWordMap: [String: String] = [
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
    
    var currentWord = ""
    var result = s.reduce(into: "") { result, char in
        if char.isNumber {
            result += String(char)
        } else {
            currentWord += String(char)
            if let digit = numberWordMap[currentWord] {
                result += digit
                currentWord = ""
            }
        }
    }
    
    return Int(result) ?? -1
}
