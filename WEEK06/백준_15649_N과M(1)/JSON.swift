let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (input[0], input[1])

var arr = Array(repeating: 0, count: m)
var isUsed = Array(repeating: false, count: n + 1)

func backtrack(_ k: Int) {
    if k == m {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }

    for i in 1...n where !isUsed[i] {
        arr[k] = i
        isUsed[i] = true
        backtrack(k + 1)
        isUsed[i] = false
    }
}

backtrack(0)
