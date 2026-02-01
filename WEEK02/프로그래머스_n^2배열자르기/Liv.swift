// 프로그래머스 - n^2 배열 자르기

import Foundation

func solution(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
    var arr: [Int] = []
    let startRow: Int = Int(left) / n
    let startColumn: Int = Int(left) % n
    let endRow: Int = Int(right) / n
    let endColumn: Int = ((endRow - startRow) * n) + Int(right) % n
    
    for index in startRow...endRow {
        arr.append(contentsOf: Array(repeating: index + 1, count: index + 1))
        arr.append(contentsOf: ((index+1)..<n).map { $0 + 1 })
    }
    
    return Array(arr[startColumn...endColumn])
}
