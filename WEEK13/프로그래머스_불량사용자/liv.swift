// 프로그래머스 - 불량 사용자

import Foundation

func solution(_ user_id: [String], _ banned_id: [String]) -> Int {
    var matched = [[String]]()
    
    for ban in banned_id {
        var list = [String]()
        for user in user_id where isMatched(user, ban) {
            list.append(user)
        }
        matched.append(list)
    }
    
    var answer = Set<Set<String>>()
    
    func dfs(_ index: Int, _ list: Set<String>) {
        if index == matched.count {
            answer.insert(list)
            return
        }
        
        for user in matched[index] where !list.contains(user) {
            var list = list
            list.insert(user)
            dfs(index + 1, list)
        }
    }
    
    dfs(0, [])
    
    return answer.count
}

func isMatched(_ user: String, _ banned: String) -> Bool {
    guard user.count == banned.count else { return false }
    
    for (a, b) in zip(user, banned) {
        if b == "*" { continue }
        if a != b { return false }
    }
    
    return true
}
    return true
}
