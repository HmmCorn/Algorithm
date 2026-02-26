import Foundation

// 시간복잡도: O(n^2) s.t. n <= 200
func solution(_ n:Int, _ computers:[[Int]]) -> Int {   
    var result = 0
    var adjList = [Int: [Int]]()
    var vis = Array(repeating: false, count: n)

    // 1. BFS 함수 정의
    func bfs(_ computer: Int) {
        var queue = [computer]
        var head = 0
        vis[computer] = true

        while head < queue.count {
            let cur = queue[head]
            head += 1
            
            for next in adjList[cur] ?? [] {
                guard !vis[next] else { continue }
                queue.append(next)
                vis[next] = true
            }
        }
    }
    
    // 2. 인접 리스트 만들기
    for i in 0..<computers.count {
        for j in 0..<computers[0].count {
            if i != j && computers[i][j] == 1 {
                adjList[i, default: []].append(j)   
            }
        }
    }

    // 3. BFS 실행
    for com in 0..<n {
        guard !vis[com] else { continue }
        bfs(com)
        result += 1
    }
    
    return result
}
