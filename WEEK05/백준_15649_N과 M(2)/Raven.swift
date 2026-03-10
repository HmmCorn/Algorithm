let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (endNum, length) = (input[0], input[1])
let numbers = (1...endNum).map { $0 }
var visited = Array(repeating: false, count: endNum)

func dfs(_ startNum: Int, _ current: [Int]) {

    if current.count == length {
        print(current.map { String($0) }.joined(separator: " "))
        return
    }

    for i in startNum..<endNum where !visited[i] {
        visited[i] = true
        dfs(i, current + [numbers[i]])
        visited[i] = false
    }
}

dfs(0, [])
