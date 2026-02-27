import Foundation

// 1 <= n <= 200
// 0 <= 각 컴퓨터 <= n-1

func solution(_ n: Int, _ computers: [[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var networkCount = 0

    func dfs(_ start: Int) {
        var stack: [Int] = [start]

        while !stack.isEmpty {
            let node = stack.removeLast()

            if visited[node] { continue }
            visited[node] = true

            for i in 0..<n {
                if computers[node][i] == 1 && !visited[i] {
                    stack.append(i)
                }
            }
        }
    }

    for i in 0..<n {
        if !visited[i] {
            dfs(i)
            networkCount += 1
        }
    }

    return networkCount
}
