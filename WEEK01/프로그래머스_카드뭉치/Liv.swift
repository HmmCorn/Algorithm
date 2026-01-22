// 프로그래머스 - 카드 뭉치

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var available: Bool = true
    var check: [String] = goal
    var first: [String] = cards1
    var second: [String] = cards2
    
    while !check.isEmpty && available {
        available = false
        if !first.isEmpty, check[0] == first[0] {
            check.remove(at: 0)
            first.remove(at: 0)
            available = true
        } else if !second.isEmpty, check[0] == second[0] {
            check.remove(at: 0)
            second.remove(at: 0)
            available = true
        }
    }
    
    return available ? "Yes" : "No"
}
