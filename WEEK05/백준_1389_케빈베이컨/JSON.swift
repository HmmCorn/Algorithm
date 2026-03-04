// 시도 1. matrix에 노드간의 거리 기록
// let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
// let (n, m) = (nm[0], nm[1])

// var adjList = [Int: [Int]]()
// var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)

// // 1. 입력값을 바탕으로 인접 리스트 만들기
// /**\
// [
//     1: [3, 4]
//     2: [3]
//     3: [1, 4, 2]
//     4: [1, 5, 3]
//     5: [4]
// ]
// */

// for _ in 0..<m {
//     let input = readLine()!.split(separator: " ").compactMap { Int($0) }
//     adjList[input[0], default: []].append(input[1])
//     adjList[input[1], default: []].append(input[0])
// }

// func bfs(_ start: Int) {
//     var vis = Array(repeating: -1, count: n + 1)
//     var queue = [start]
//     vis[start] = 0
//     var head = 0
    
//     while head < queue.count {
//         let cur = queue[head]
//         head += 1
    
//         for next in adjList[cur, default: []] {
//             guard vis[next] == -1 else { continue }
//             queue.append(next)
//             vis[next] = vis[cur] + 1
            
//             matrix[start - 1][next - 1] = vis[cur] + 1
//             // matrix[next - 1][start - 1] = vis[cur] + 1
//         }
//     }
// }

// for num in 1...n {
//     bfs(num)
// }

// let result = matrix.enumerated().sorted { $0.1.reduce(0, +) < $1.1.reduce(0, +) }.first!
// print(result.0 + 1)

// 시도 2. BFS의 결과를 바로 사용
let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])

var adjList = [Int: [Int]]()

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    adjList[input[0], default: []].append(input[1])
    adjList[input[1], default: []].append(input[0])
}

func bfs(_ start: Int) -> Int {
    var vis = Array(repeating: -1, count: n + 1)
    var queue = [start]
    vis[start] = 0
    var head = 0
    
    while head < queue.count {
        let cur = queue[head]
        head += 1
    
        for next in adjList[cur, default: []] {
            guard vis[next] == -1 else { continue }
            queue.append(next)
            vis[next] = vis[cur] + 1
        }
    }

    return vis.dropFirst().reduce(0, +)
}

var result = 0
var min = Int.max
for user in 1...n {
    let cabinBacon = bfs(user)
    if cabinBacon < min {
        result = user
        min = cabinBacon
    }
}

print(result)
