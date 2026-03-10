let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
var arr = [Int](repeating: 0, count: m)
var output = [String]()

func dfs(_ depth: Int) {
    if depth == m {
        output.append(arr.map(String.init).joined(separator: " "))
        return
    }

    for i in 1...n {
        arr[depth] = i
        dfs(depth + 1)
    }
}

dfs(0)
print(output.joined(separator: "\n"))