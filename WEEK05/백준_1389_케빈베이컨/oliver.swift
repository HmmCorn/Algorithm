// solution
func solution(_ graph: [[Int]]) -> Int {

    let n = graph.count - 1

    func bfs(_ person: Int) -> Int {
        var queue: [Int] = []
        var queueIndex = 0

        var distances = Array(repeating: -1, count: n+1)

        queue.append(person)
        distances[person] = 0

        while queueIndex < queue.count {
            let current = queue[queueIndex]
            queueIndex += 1

            for next in 1...n {
                if graph[current][next] == 1 && distances[next] == -1 {
                    distances[next] = distances[current] + 1
                    queue.append(next)
                }
            }
        }

        return distances.reduce(0, +)
    }

    var minSum = Int.max
    var result = 0

    for person in 1...n {
        let sum = bfs(person)
        if sum < minSum {
            minSum = sum
            result = person
        }
    }

    return result
}

// main
let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]  // 2 ~ 100, 유저 수
let m = nm[1]  // 1 ~ 5000, 친구 관계 수

// 인접 행렬
var graph = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    let a = line[0]
    let b = line[1]

    graph[a][b] = 1
    graph[b][a] = 1
}

print(solution(graph))
