// 백준 - 15649 N과 M

let line = readLine()!.split(separator: " ").map { Int($0)! }
let max: Int = line[0]
let length: Int = line[1]

for i in 1...max {
    dfs([i], length, max)
}

func dfs(_ stack: [Int], _ length: Int, _ max: Int) {
    guard stack.count != length else {
        print(stack.map {String($0)}.joined(separator: " "))
        return
    }

    let filtered = (1...max).filter { !stack.contains($0) }
    for next in filtered {
        dfs(stack + [next], length, max)
    }
}
