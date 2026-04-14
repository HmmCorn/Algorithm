let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating:Array(repeating: Int.max, count: n + 1), count: n + 1)

for _ in 0..<m {
    let component = readLine()!.split(separator: " ").compactMap {Int($0)}
    let start = component[0]
    let end = component[1]
    let cost = component[2]

    // 중복 있음;; 최솟값만 넣기
    if graph[start][end] > cost { graph[start][end] = cost }
}

// for i in 1..<graph.count {
//     let row = graph[i].map { $0 == Int.max ? "-": String($0) }.joined(separator: " ")
//     print(row)
// }

// 경유
for k in 1...n {
    // 시작
    for i in 1...n {
        // 도착
        for j in 1...n {
            if i == j { graph[i][j] = 0 }
            if graph[i][k] != Int.max && graph[k][j] != Int.max {
                let cost = graph[i][k] + graph[k][j]
                if graph[i][j] > cost {
                    graph[i][j] = cost
                }
            }
        }
    }
}

// 만약, i에서 j로 갈 수 없는 경우에는 그 자리에 0을 출력한다.
for i in 1..<graph.count {
    graph[i].removeFirst()
    let row = graph[i].map { $0 == Int.max ? "0" : String($0) }.joined(separator: " ")
    print(row)
}
