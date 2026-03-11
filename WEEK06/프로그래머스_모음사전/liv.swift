// 프로그래머스 - 모음 사전

import Foundation

func solution(_ word: String) -> Int {
    let vowels = ["A", "E", "I", "O", "U"]
    var result = 0
    var count = 0
    
    func dfs(_ current: String) {
        if word == current {
            result = count
            return
        }
        
        if current.count == 5 { return }
        
        for next in vowels {
            count += 1
            dfs(current + next)
        }
    }

    dfs("")
    return result
}
