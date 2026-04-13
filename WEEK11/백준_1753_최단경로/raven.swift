let input = readLine()!.split(separator: " ").compactMap {Int($0)}
// 정점의 개수
let v = input[0]
// 간선의 개수
let e = input[1]
// 시작 정점
let k = Int(readLine()!)!

var graph: [[(Int, Int)]] = Array(repeating: [], count: v + 1)

for _ in 0..<e {
    let data = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[data[0]].append((data[1], data[2]))
}

var distances = Array(repeating: Int.max, count: v + 1)
var fixs = Array(repeating: false, count: v + 1)
distances[k] = 0

for _ in 1...v {
    var minDistance = Int.max
    var current = -1

    // 선택 노드 찾기 초기 값 지정 해줘서 1번부터 시작
    for i in 1...v {
        if !fixs[i] && distances[i] < minDistance {
            minDistance = distances[i]
            current = i
            break
        }
    }

    // 노드 없으면 종료
    if current == -1 { break }
    fixs[current] = true

    // 선택 노드와 연결된 노드 거리 갱신 (현 노드까지 거리 + 거리)
    for (next, weight) in graph[current] {
         if distances[next] > distances[current] + weight {
             distances[next] = distances[current] + weight
         }
    }
}

for i in 1..<distances.count {
    if distances[i] == Int.max {
        print("INF")
    } else {
        print(distances[i])
    }
}
