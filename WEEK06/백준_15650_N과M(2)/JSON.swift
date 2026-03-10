let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (input[0], input[1])

var isUsed = [Bool](repeating: false, count: n + 1)
var arr = [String](repeating: "0", count: m)

func backtrack(_ k: Int, _ start: Int) {
    if k == m {
        print(arr.joined(separator: " "))
        return
    }

    for i in start...n where !isUsed[i] {
        isUsed[i] = true
        arr[k] = String(i)
        backtrack(k + 1, i)
        isUsed[i] = false
    }
}

backtrack(0, 1)
