let tc = Int(readLine()!)!

for _ in 0..<tc {
    let nmw = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, m, w) = (nmw[0], nmw[1], nmw[2])
    
    var graph: [[(node: Int, weight: Int)]] = Array(repeating: [], count: n+1)

    // 도로
    for _ in 0..<m {
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        let (s, e, t) = (line[0], line[1], line[2])

        graph[s].append((node: e, weight: t))
        graph[e].append((node: s, weight: t))
    }

    // 웜홀
    for _ in 0..<w {
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        let (s, e, t) = (line[0], line[1], line[2])

        graph[s].append((node: e, weight: -t))
    }

    // n-1번 반복
    // - 전체 간선을 하나씩 확인
    // - 더 짧으면 최단 거리 테이블 갱신
    // 한번 더 했는데, 갱신되면 음수 사이클이 존재

    var dist = Array(repeating: 0, count: n+1)
    var result = false

    for _ in 1...n-1 {
        for from in 1...n {
            for edge in graph[from] {
                let to = edge.node
                let weight = edge.weight

                dist[to] = min(dist[to], dist[from] + weight)
            }
        }
    }

    for from in 1...n {
        for edge in graph[from] {
            let to = edge.node
            let weight = edge.weight

            if dist[to] > dist[from] + weight {
                result = true
                break
            }
        }
        if result { break }
    }

    print(result ? "YES" : "NO")
}
