// 프로그래머스 - 소수 찾기

import Foundation

func solution(_ numbers: String) -> Int {
    let list = numbers.compactMap { Int(String($0)) }
    var result = Set<Int>()
    var visited = [Bool](repeating: false, count: list.count)
    
    func dfs(_ current: Int) {
        result.insert(current)
        
        for (index, next) in list.enumerated() where !visited[index] {
            visited[index] = true
            dfs(current*10 + next)
            visited[index] = false
        }
    }
    
    dfs(0)
    return result.filter { isPrime($0) }.count
}

func isPrime(_ number: Int) -> Bool {
    if number < 2 { return false }
    for index in 2..<Int(sqrt(Double(number)) + 1) {
        if number % index == 0 { return false }
    }
    return true
}
