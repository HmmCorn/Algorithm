// 프로그래머스 - 여행 경로

import Foundation

func solution(_ tickets: [[String]]) -> [String] {
    var list: [String: [(String, Bool)]] = [:] // "ICN": [("JFK", 0)] -> 0이면 방문 이전, 1이면 방문
    var result = [String]()
    
    for ticket in tickets {
        list[ticket[0], default: []].append((ticket[1], false))
    }
    
    for key in list.keys {
        list[key]!.sort { $0.0 < $1.0 }
    }
    
    func dfs(_ current: String, _ path: [String]) -> Bool {
        if path.count == tickets.count + 1 {
            result = path
            return true
        }
        
        guard let candidates = list[current] else { return false }
        
        for index in 0..<candidates.count {
            if list[current]![index].1 { continue }
            
            let next = list[current]![index].0
            list[current]![index].1 = true
            
            if dfs(next, path + [next]) { return true }
            
            list[current]![index].1 = false
        }
        
        return false
    }
    
    _ = dfs("ICN", ["ICN"])
    return result
}
