// func solution(_ dartResult: String) -> Int {
//     // dartResult 순회하면서 라운드 분리
//     var rounds: [String] = []
//     let chars = Array(dartResult)
//     var current = ""
//     var i = 0

//     while i < chars.count {
//         current.append(chars[i])

//         if chars[i] == "S" || chars[i] == "D" || chars[i] == "T" {
//             if i + 1 < chars.count {
//                 chars[i + 1] == "*" || chars[i + 1] == "#" {

//                 }
//             }
//         }
//     }

//     // rounds를 순회하면서 각 항을 구성
//     var first: Int = 0
//     var second: Int = 0
//     var third: Int = 0
//     for round in rounds {

//     }

//     return first + second + third
// }



func solution(_ dartResult: String) -> Int {
    var scores: [Int] = []
    var currentNumber = 0

    for char in dartResult {
        if char.isNumber {
            currentNumber = currentNumber * 10 + Int(String(char))!
        } else if char == "S" {
            scores.append(currentNumber)
            currentNumber = 0
        } else if char == "D" {
            scores.append(currentNumber * currentNumber)
            currentNumber = 0
        } else if char == "T" {
            scores.append(currentNumber * currentNumber * currentNumber)
            currentNumber = 0
        } else if char == "*" {
            let nowIndex = scores.count - 1
            let frontIndex = nowIndex - 1
            scores[nowIndex] *= 2
            if frontIndex > -1 {
                scores[frontIndex] *= 2
            }
        } else if char == "#" {
            let nowIndex = scores.count - 1
            scores[nowIndex] *= -1
        }
    }

    return scores.reduce(0, +)
}
