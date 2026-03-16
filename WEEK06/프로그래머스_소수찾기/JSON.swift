// 시도 1 - backtrack의 cur 타입이 [String]
//import Foundation
//
//func solution(_ numbers:String) -> Int {
//    var result = Set<Int>()
//    let nums = numbers.map { String($0) }
//
//    var isUsed = Array(repeating: false, count: nums.count)
//
//    func backtrack(_ cur: [String]) {
//        if !cur.isEmpty {
//            let num = Int(cur.joined(separator: ""))!
//            if isPrime(num) {
//                result.insert(num)
//            }
//        }
//
//        for (idx, num) in nums.enumerated() where !isUsed[idx] {
//            isUsed[idx] = true
//            backtrack(cur + [num])
//            isUsed[idx] = false
//        }
//    }
//
//    backtrack([])
//
//    return result.count
//}
//
//func isPrime(_ num: Int) -> Bool {
//    guard num > 1 else { return false }
//
//    let end = Int(Float(num).squareRoot()) + 1
//
//    for i in 2..<end {
//        if num % i == 0 {
//            return false
//        }
//    }
//
//    return true
//}

// 시도 2
// - backtrack 재귀 호출 시 배열 재할당 오버헤드 제거를 위해 cur 타입을 Int로 변경
// - isPrime 호출 횟수를 줄이기 위해 소수 검사를 완전 탐색 종료 후 진행 (예: 011, 11)
import Foundation

func solution(_ numbers:String) -> Int {
    let nums = numbers.compactMap { Int(String($0)) }
    var result = Set<Int>()
    var isUsed = Array(repeating: false, count: nums.count)

    func backtrack(_ cur: Int) {
        result.insert(cur)

        for (idx, num) in nums.enumerated() where !isUsed[idx] {
            isUsed[idx] = true
            backtrack(cur * 10 + num)
            isUsed[idx] = false
        }
    }

    backtrack(0)

    return result.filter { isPrime($0) }.count
}

func isPrime(_ num: Int) -> Bool {
    guard num > 1 else { return false }
    let end = Int(Float(num).squareRoot()) + 1

    for i in 2..<end {
        if num % i == 0 {
            return false
        }
    }

    return true
}
