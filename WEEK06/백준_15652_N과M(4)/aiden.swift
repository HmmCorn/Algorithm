let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
var stack = [Int]()

func dfs(_ start: Int) {
    if stack.count == m {
        print(stack.map(String.init).joined(separator: " "))
        return
    } 
    if start > n { return }

    for i in start...n {
        stack.append(i)
        dfs(i)
        _ = stack.popLast()
    }
}

dfs(1)