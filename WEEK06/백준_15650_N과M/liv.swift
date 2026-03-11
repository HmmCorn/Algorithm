// 백준 - 15650 N과 M (2)

let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (line[0], line[1])

var sequence = [Int](repeating: 0, count: m)
var result = [String]()

dfs(0, 0)
print(result.joined(separator: "\n"))

func dfs(_ depth: Int, _ previous: Int) {
    if depth == m {
        result.append(sequence.map { String($0) }.joined(separator: " "))
        return
    }
    if previous == n { return }

    for next in previous+1...n where next > 0 {
        sequence[depth] = next
        dfs(depth + 1, next)
    }
}
