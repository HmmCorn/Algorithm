let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]

let nums = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var result = Array(repeating: 0, count: m)
var output = ""

func dfs(_ depth: Int) {

    if depth == m {
        output += result.map { String($0) }.joined(separator: " ") + "\n"
        return
    }

    var prev = -1

    for i in 0..<n {
        guard prev != nums[i] else { continue }
        if depth > 0 && result[depth - 1] > nums[i] { continue }
        result[depth] = nums[i]
        prev = nums[i]
        dfs(depth + 1)
    }
    
}

dfs(0)
print(output)
