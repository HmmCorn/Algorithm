// 프로그래머스 큰 수 만들기

import Foundation

func solution(_ number: String, _ k: Int) -> String {
    var numbers = [String]()
    var count = 0
    
    for item in number {
        let item = String(item)
        var flag = false
        
        while !flag && count < k {
            if let last = numbers.last, last < item {
                numbers.removeLast()
                count += 1
            } else {
                flag = true
            }
        }
        numbers.append(item)
    }
    
    if count != k { numbers.removeLast(k-count) }
    return numbers.joined()
}
