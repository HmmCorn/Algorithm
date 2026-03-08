let testCaseCount = Int(readLine()!)!
let directions: [(Int, Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]

for _ in 0..<testCaseCount {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let rc = input[0]
    let cc = input[1]
    let nc = input[2]

    var queue: [(Int, Int)] = []
    var map: [[Int]] = Array(repeating: Array(repeating: 0, count: cc), count: rc)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: cc), count: rc)
    
    for _ in 0..<nc {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        queue.append((input[0], input[1]))
        map[input[0]][input[1]] = 1
    }

    func bfs(_ row:Int, _ column: Int) {
        visited[row][column] = true

        let nexts = directions.map { (($0.0 + row), ($0.1 + column)) }.filter { (0..<rc).contains($0.0) && (0..<cc).contains($0.1) }
        
        for next in nexts {
            if !visited[next.0][next.1] && map[next.0][next.1] == 1 {
                bfs(next.0, next.1)
            }
        }
    }

    var result = 0
    
    for row in 0..<rc {
        for column in 0..<cc {
            if !visited[row][column] && map[row][column] == 1 {
                bfs(row, column)
                result += 1
            }
        }
    }

    print(result)
}
