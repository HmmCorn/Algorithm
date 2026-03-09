/*
// 시간초과
let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]

var result = Array(repeating: 0, count: m)

func dfs(_ depth: Int) {
    if depth == m {
        print(result.map { String($0) }.joined(separator: " "))
        return
    }

    for i in 1...n {
        result[depth] = i
        dfs(depth + 1)
    }
}

dfs(0)
*/

let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]

var result = Array(repeating: 0, count: m)
var output: String = ""

func dfs(_ depth: Int) {
    if depth == m {
        for i in 0..<m {
            output += "\(result[i]) "
        }
        output += "\n"
        return
    }

    for i in 1...n {
        result[depth] = i
        dfs(depth + 1)
    }
}

dfs(0)
print(output)
