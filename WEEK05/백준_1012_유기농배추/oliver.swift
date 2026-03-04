// solution
func solution(_ m: Int, _ n: Int, _ napaCabbages: [(Int, Int)]) -> Int {
    // 전처리
    var grid = Array(repeating: Array(repeating: 0, count: m), count: n)
    for (x, y) in napaCabbages {
        grid[y][x] = 1
    }

    var visited = Array(repeating: Array(repeating: false, count: m), count: n)

    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]

    // dfs
    func dfs(_ x: Int, _ y: Int) {
        visited[y][x] = true

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx >= 0 && nx < m && ny >= 0 && ny < n {
                if grid[ny][nx] == 1 && !visited[ny][nx] {
                    dfs(nx, ny)
                }
            }
        }
    }


    // 결과
    var result = 0

    for y in 0..<n {
        for x in 0..<m {
            if grid[y][x] == 1 && !visited[y][x] {
                dfs(x, y)
                result += 1
            }
        }
    }

    return result
}

// main
let t = Int(readLine()!)!

for _ in 0..<t {
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    let m = mnk[0]  // 1 ~ 50, 가로
    let n = mnk[1]  // 1 ~ 50, 세로
    let k = mnk[2]  // 1 ~ 2500, 배추 개수

    var napaCabbages: [(Int, Int)] = []

    for _ in 0..<k {
        let position = readLine()!.split(separator: " ").map { Int($0)! }
        napaCabbages.append((position[0], position[1]))
    }

    let result = solution(m, n, napaCabbages)
    print(result)
}
