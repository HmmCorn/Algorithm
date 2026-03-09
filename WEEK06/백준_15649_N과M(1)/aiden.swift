let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
var visited = [Bool](repeating: false, count: n + 1)

func dfs(_ route: [Int]) {
    if route.count == m {
        print(route.map(String.init).joined(separator: " "))
        return
    }

    for i in 1...n where !visited[i]{
        visited[i] = true
        dfs(route + [i])
        visited[i] = false
    }
}

dfs([])