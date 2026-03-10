let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]

let nums = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var result = Array(repeating: 0, count: m)
var visited = Array(repeating: false, count: n)

func dfs(_ depth: Int) {
    if depth == m {
        print(result.map { String($0) }.joined(separator: " "))
        return
    }

    var prev = 0

    for i in 0..<n {
        guard !visited[i] else { continue }
        guard prev != nums[i] else { continue }

        visited[i] = true
        result[depth] = nums[i]
        prev = nums[i]
        dfs(depth + 1)
        visited[i] = false
    }
}

dfs(0)
