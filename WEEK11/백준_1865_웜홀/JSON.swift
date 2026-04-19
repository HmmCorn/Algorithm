/**
- 도로는 무방향, 웜홀은 방향

3 3 1    // (지점 개수, 간선 개수, 웜홀 개수)
1 2 2    // 간선 정보
1 3 4
2 3 1
3 1 3    // 웜홀 정보

"출발 지점으로 다시 돌아왔을 때" -> 사이클 가정
-> 사이클에 음수 간선이 포함되어 있는지만 판단하면 됨.

출발지가 명시되지 않음. 그러나 음수 간선의 유무만 판단하면 되기 때문에 dist를 0으로 초기화해도 됨.
*/
let tc = Int(readLine()!)!

for _ in 0..<tc {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (branchCount, roadCount, holeCount) = (input[0], input[1], input[2])
    var edges = [(s: Int, e: Int, w: Int)]()

    // 도로 입력 받기
    for _ in 0..<roadCount {
        let road = readLine()!.split(separator: " ").compactMap { Int($0) }
        edges.append((road[0], road[1], road[2]))
        edges.append((road[1], road[0], road[2]))
    }

    // 웜홀 입력 받기
    for _ in 0..<holeCount {
        let hole = readLine()!.split(separator: " ").compactMap { Int($0) }
        edges.append((hole[0], hole[1], -hole[2]))
    }

    // 벨만 포드 돌리기
    let result = bf(edges, branchCount)
    print(result ? "YES" : "NO")
}

func bf(_ edges: [(s: Int, e: Int, w: Int)], _ branchCount: Int) -> Bool {
    var dist = [Int](repeating: 0, count: branchCount + 1)

    for i in 0..<branchCount {
        for edge in edges {
            let nextDist = dist[edge.s] + edge.w
            if nextDist < dist[edge.e] {
                dist[edge.e] = nextDist

                if i == branchCount - 1 { return true }
            }
        }
    }

    return false
}
