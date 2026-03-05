import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited: [Bool] = Array(repeating: false, count: n)
    var result: Int = 0
    
    func dfs(_ node: Int) {
        visited[node] = true
        
        for next in 0..<n {
            if computers[node][next] == 1 && !visited[next] {
                dfs(next)
            }
        }
    }
    
    for node in 0..<n {
        if !visited[node] {
            dfs(node)
            result += 1
        }
    }

    return result
}
