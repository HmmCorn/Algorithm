let n = Int(readLine()!)!
let delta = [(-1, 0), (1, 0), (0, -1), (0, 1)]

for _ in 0..<n {
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    let (rowCount, colCount, count) = (mnk[0], mnk[1], mnk[2])

    var result = 0
    var grid = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    var vis = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)

    for _ in 0..<count {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        grid[input[0]][input[1]] = 1
    }

    for row in 0..<rowCount {
        for col in 0..<colCount {
            guard !vis[row][col] && grid[row][col] == 1 else { continue }
            bfs(row, col)
            result += 1
        }
    }

    print(result)

    func bfs(_ row: Int, _ col: Int) {
        var queue = [(row, col)]
        vis[row][col] = true
        var head = 0

        while head < queue.count {
            let (curRow, curCol) = queue[head]
            head += 1

            for d in delta {
                let (nextRow, nextCol) = (curRow + d.0, curCol + d.1)
                guard (0..<rowCount).contains(nextRow) && (0..<colCount).contains(nextCol) else { continue }
                guard !vis[nextRow][nextCol] && grid[nextRow][nextCol] == 1 else { continue }
                queue.append((nextRow, nextCol))
                vis[nextRow][nextCol] = true
            }
        }
    }
}

