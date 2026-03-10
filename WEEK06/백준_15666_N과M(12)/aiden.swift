let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
let sorted = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
var visited = [Bool](repeating: false, count: n)
var stack = [Int]()
var output = [String]()

func dfs(_ start: Int) {
    if stack.count == m {
        output.append(stack.map(String.init).joined(separator: " "))
        return
    } 

    var prev = -1

    for i in start..<n where prev != sorted[i] {
        prev = sorted[i]
        stack.append(sorted[i])
        dfs(i)
        _ = stack.popLast()
    }
}

dfs(0)
print(output.joined(separator: "\n"))