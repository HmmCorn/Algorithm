let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]

var result = Array(repeating: 0, count: m)
var output = ""

func dfs(_ depth: Int, _ start: Int) {
    if depth == m {
        output += result.map { String($0) }.joined(separator: " ") + "\n"
        return
    }

    for i in start..<n {
        if depth > 0 && result[depth - 1] > i+1 { continue }

        result[depth] = i+1
        dfs(depth + 1, start)
    }
}

dfs(0, 0)
print(output)
