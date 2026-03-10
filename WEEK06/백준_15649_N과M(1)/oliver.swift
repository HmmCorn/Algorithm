let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]

var result = Array(repeating: 0, count: m)
var visited = Array(repeating: false, count: n+1)

func dfs(_ depth: Int) {
    if depth == m {
        print(result.map { String($0) }.joined(separator: " "))
        return
    }

    for i in 1...n {
        if !visited[i] {
            visited[i] = true
            result[depth] = i
            dfs(depth + 1)
            visited[i] = false
        }
    }
}

dfs(0)
