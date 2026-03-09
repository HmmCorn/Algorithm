let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
var sorted = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
var visited = [Bool](repeating: false, count: n)

var arr = [Int](repeating: 0, count: m)
var output = [String]()

func dfs(_ depth: Int) {
    if depth == m {
        output.append(arr.map(String.init).joined(separator: " "))
        return
    }

    var prev = -1

    for i in 0..<n where !visited[i] && prev != sorted[i] {
        visited[i] = true
        prev = sorted[i]
        arr[depth] = sorted[i]
        dfs(depth + 1)
        visited[i] = false
    }
}

dfs(0)
print(output.joined(separator: "\n"))