// 프로그래머스 - 튜플
import Foundation

func solution(_ s: String) -> [Int] {
    let sets = getSets(s).sorted { $0.count < $1.count }
    var tuple = [Int]()
    
    for group in sets {
        for number in group where !tuple.contains(number) {
            tuple.append(number)
        }
    }
    return tuple
}

func getSets(_ s: String) -> [[Int]] {
    let sets = s.split(separator: "}")
    var numbers = [[Int]]()
    
    for s in sets {
        let chars = Array(s)
        var number = [Int]()
        var index = 0
        
        while index < chars.count {
            var item = ""
            
            while index < chars.count {
                if chars[index].isNumber {
                    item += String(chars[index])
                    index += 1
                }
                else { break }
            }
            
            if let word = Int(item) { number.append(word) }
            index += 1
        }
        
        numbers.append(number)
    }
    
    return numbers
}

// func getSets(_ s: String) -> [[Int]] {
//     let trimmed = s.replacingOccurrences(of: "{{", with: "")
//                     .replacingOccurrences(of: "}}", with: "")
//     return trimmed.components(separatedBy: "},{").map {
//         $0.components(separatedBy: ",").compactMap { Int($0) }
//     }
// }
