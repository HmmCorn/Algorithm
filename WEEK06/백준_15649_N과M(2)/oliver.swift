let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]

var result = Array(repeating: 0, count: m)
// var visited = Array(repeating: false, count: n)

func dfs(_ depth: Int) {
    if depth == m {
        print(result.map { String($0) }.joined(separator: " "))
        return
    }

    for i in 0..<n {
        // guard !visited[i] else { continue }
        if depth > 0 && i+1 <= result[depth - 1] { continue }

        // visited[i] = true
        result[depth] = i+1

        dfs(depth + 1)
        // visited[i] = false
    }
}

dfs(0)
