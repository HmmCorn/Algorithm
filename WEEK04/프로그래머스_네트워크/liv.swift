// 프로그래머스 - 네트워크

import Foundation

func solution(_ n: Int, _ computers: [[Int]]) -> Int {
    // 예외: 모든 노드가 독립적일 때
    // 이거 추가하니까 특정 케이스에서 시간이 많이 늘어났음
    // let all: [Int] = computers.flatMap { $0 }.filter { $0 == 1 }
    // if all.count == n { return n }
    
    var visited: Set<Int> = []
    var count: Int = 0
    
    func bfs(_ start: Int) {
        var queue : [Int] = []
        var head: Int = 0
        
        queue.append(start)
        visited.insert(start)
        
        while queue.count > head {
            let node = queue[head]
            head += 1
            
            let connected = computers[node]
            
            for (next, isConnected) in connected.enumerated() where isConnected == 1 && !visited.contains(next) {
                visited.insert(next)
                queue.append(next)
            }
        }
    }

    for i in 0..<n where !visited.contains(i) {
        bfs(i)
        count += 1
    }
    
    return count
}
