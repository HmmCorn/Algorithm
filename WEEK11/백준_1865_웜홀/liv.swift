// 백준 - 1865 웜홀

let caseCount = Int(readLine()!)!

for _ in (1...caseCount) { print(solution() ? "YES" : "NO") }

func solution() -> Bool {
    let nmw = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, m, w) = (nmw[0], nmw[1], nmw[2])

    var graph = [[(Int, Int)]](repeating: [], count: n+1)

    for _ in 1...m {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        graph[line[0]].append((line[1], line[2]))
        graph[line[1]].append((line[0], line[2]))
    }
    
    for _ in 1...w {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        graph[line[0]].append((line[1], -line[2]))
    }

    var dist = [Int](repeating: 0, count: n+1)

    for i in 1...n {
        for j in 1...n {
            for (next, weight) in graph[j] where dist[next] > dist[j] + weight {
                dist[next] = dist[j] + weight
                if i == n { return true }
            }
        }
    }
    return false
}
