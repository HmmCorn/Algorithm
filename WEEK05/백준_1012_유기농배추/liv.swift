// 백준 - 1012 유기농 배추

let caseCount: Int = Int(readLine()!)!

for _ in 0..<caseCount {
    let line: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let width: Int = line[0]
    let height: Int = line[1]
    let cabbage: Int = line[2]
    
    var areas: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: width), count: height)
    for _ in 0..<cabbage {
        let location = readLine()!.split(separator: " ").map { Int($0)! }
        areas[location[1]][location[0]] = 1
    }

    let directions = [(-1, 0), (0, -1), (0, 1), (1, 0)]
    var count: Int = 0
    for i in 0..<height {
        for j in 0..<width where areas[i][j] == 1 && !visited[i][j] {
            // dfs(i, j)
            bfs(i, j)
            count += 1
        }
    }

    print(count)
    
    func dfs(_ row: Int, _ col: Int) {
        visited[row][col] = true
        for next in directions {
            let nextRow = row + next.0
            let nextCol = col + next.1
            if nextRow >= 0, nextRow < height,
               nextCol >= 0, nextCol < width,
               areas[nextRow][nextCol] == 1,
               !visited[nextRow][nextCol] {
                
                dfs(nextRow, nextCol)
            }
        }
    }

    func bfs(_ row: Int, _ col: Int) {
        var queue: [(Int, Int)] = [(row, col)]
        var head: Int = 0
        visited[row][col] = true

        while queue.count > head {
            let (currentRow, currentCol) = queue[head]
            head += 1

            for next in directions {
                let nextRow = currentRow + next.0
                let nextCol = currentCol + next.1
                if nextRow >= 0, nextRow < height,
                   nextCol >= 0, nextCol < width,
                   areas[nextRow][nextCol] == 1,
                   !visited[nextRow][nextCol] {
                       visited[nextRow][nextCol] = true
                       queue.append((nextRow, nextCol))
                   }
            }
        }
    }
}
