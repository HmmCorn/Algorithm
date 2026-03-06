let t = Int(readLine()!)!
for _ in 0..<t { solution() }

func solution() {
    var result = 0
    
    let mnk = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (m, n, k) = (mnk[0], mnk[1], mnk[2])

    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var board = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var targets = [(Int, Int)]()
    for _ in 0..<k {
        let cr = readLine()!.split(separator: " ").compactMap { Int($0) }
        let (c, r) = (cr[0], cr[1])
        targets.append((r, c))
        board[r][c] = 1
    }    

    for (r, c) in targets where !visited[r][c] {
        dfs(r, c)
        result += 1
    }

    print(result)

    func dfs(_ r: Int, _ c: Int) {
        visited[r][c] = true
        for (dr, dc) in directions {
            let nr = r + dr
            let nc = c + dc

            guard nr >= 0, nr < n, nc >= 0, nc < m, board[nr][nc] == 1, !visited[nr][nc] else { continue }
            dfs(nr, nc)
        }
    }
}
