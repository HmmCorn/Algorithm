let cityCount = Int(readLine()!)!
let busCount = Int(readLine()!)!
let MAX = 100_000 * busCount + 1

var graph = [[(w: Int, v: Int)]](repeating: [], count: cityCount)
for _ in 0..<busCount {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0] - 1].append((input[2], input[1] - 1))
}

var table = [[Int]](repeating: [Int](repeating: MAX, count: cityCount), count: cityCount)

for curCity in 0..<cityCount {
    table[curCity][curCity] = 0
    for (nextWeight, nextCity) in graph[curCity] {
        if nextWeight < table[curCity][nextCity] {
            table[curCity][nextCity] = nextWeight
        }
    }
}

for k in 0..<cityCount {
    for s in 0..<cityCount {
        for e in 0..<cityCount {
            let newPath = table[s][k] + table[k][e]
            if newPath < table[s][e] {
                table[s][e] = newPath
            }
        }
    }
}

for s in 0..<cityCount {
    for e in 0..<cityCount {
        if table[s][e] == MAX { table[s][e] = 0 }
    }
}

print(table.map { $0.map { String($0) }.joined(separator: " ") }.joined(separator: "\n"))
