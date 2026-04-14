let INF = 100_000 * 100 + 1
let n = Int(readLine()!)!
let m = Int(readLine()!)!

// 인접리스트
var graph: [[(node: Int, weight: Int)]] = Array(repeating: [], count: n+1)
for _ in 0..<m {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (a, b, c) = (line[0], line[1], line[2])

    graph[a].append((node: b, weight: c))
}

// dist 초기화
var dist: [[Int]] = Array(repeating: Array(repeating: INF, count: n+1), count: n+1)
for i in 1...n {
    dist[i][i] = 0
}

// graph 순회하면서 dist행렬 채우기
for i in 1...n {
    for edge in graph[i] {
        let destination = edge.node
        let weight = edge.weight

        dist[i][destination] = min(weight, dist[i][destination])
    }
}

// 플로이드
for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
        }
    }
}

// 출력
for i in 1...n {
    var row: [String] = []
    for j in 1...n {
        if dist[i][j] == INF {
            row.append("0")
        } else {
            row.append(String(dist[i][j]))
        }
    }
    print(row.joined(separator: " "))
}
