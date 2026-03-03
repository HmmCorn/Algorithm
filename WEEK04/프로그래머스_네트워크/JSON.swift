import Foundation

// 시간복잡도: O(n^2) s.t. n <= 200

// 시도 1. 인접 행렬을 인접 리스트로 변환
// func solution(_ n:Int, _ computers:[[Int]]) -> Int {   
//     var result = 0
//     var adjList = [Int: [Int]]()
//     var vis = Array(repeating: false, count: n)

//     // 1. BFS 함수 정의
//     func bfs(_ computer: Int) {
//         var queue = [computer]
//         var head = 0
//         vis[computer] = true

//         while head < queue.count {
//             let cur = queue[head]
//             head += 1
            
//             for next in adjList[cur] ?? [] {
//                 guard !vis[next] else { continue }
//                 queue.append(next)
//                 vis[next] = true
//             }
//         }
//     }
    
//     // 2. 인접 리스트 만들기
//     for i in 0..<computers.count {
//         for j in 0..<computers[0].count {
//             if i != j && computers[i][j] == 1 {
//                 adjList[i, default: []].append(j)   
//             }
//         }
//     }

//     // 3. BFS 실행
//     for com in 0..<n {
//         guard !vis[com] else { continue }
//         bfs(com)
//         result += 1
//     }
    
//     return result
// }

// 시도 2. 인접 행렬 그대로 사용

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var result = 0
    var vis = Array(repeating: false, count: n)

    func bfs(_ com: Int) {
        var queue = [com]
        var head = 0
        vis[com] = true
        
        while head < queue.count {
            let cur = queue[head]
            head += 1
            
            for (idx, isConnected) in computers[cur].enumerated() {
                if isConnected == 1 && !vis[idx] {
                    queue.append(idx)
                    vis[idx] = true
                }
            }
        }
    }

    for com in 0..<n {
        if !vis[com] {
            bfs(com)
            result += 1
        }
    }
    
    return result
}

// 시도 3. DFS로 풀어보기
// func solution(_ n:Int, _ computers:[[Int]]) -> Int {
//     var result = 0
//     var vis = Array(repeating: false, count: n)
    
//     func dfs(_ com: Int) {
//         var stack = [com]
//         vis[com] = true
        
//         while !stack.isEmpty {
//             let cur = stack.removeLast()
            
//             for (idx, isConnected) in computers[cur].enumerated() {
//                 if !vis[idx] && isConnected == 1 {
//                     stack.append(idx)
//                     vis[idx] = true
//                 }
//             }
//         }
//     }
    
//     for com in 0..<n {
//         if !vis[com] {
//             dfs(com)
//             result += 1
//         }
//     }
    
//     return result
// }
