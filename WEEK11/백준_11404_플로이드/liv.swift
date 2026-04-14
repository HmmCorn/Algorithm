// 백준 - 11404 플로이드

let cityCount = Int(readLine()!)!
let busCount = Int(readLine()!)!
let basic = [Int](repeating: .max, count: cityCount+1)
var graph = [[Int]](repeating: basic, count: cityCount+1)

for _ in 1...busCount {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[line[0]][line[1]] = min(graph[line[0]][line[1]], line[2])
}

for city in 1...cityCount {
    graph[city][city] = 0
     for start in 1...cityCount where graph[start][city] != Int.max {         
         for end in 1...cityCount where graph[city][end] != Int.max {
             let newWeight = graph[start][city] + graph[city][end]
             if graph[start][end] > newWeight { graph[start][end] = newWeight }
         }
    }
}

for i in 1...cityCount {
    print((1...cityCount).map {
        graph[i][$0] == Int.max ? "0" : String(graph[i][$0])
    }.joined(separator: " "))
}
