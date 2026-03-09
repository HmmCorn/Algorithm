// 백준 - 15649 N과 M

let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let (max, length) = (line[0], line[1])

var isUsed: [Bool] = Array(repeating: false, count: max)
var arr: [Int] = Array(repeating: 0, count: length)

dfs(0)

func dfs(_ currentSlot: Int) {
    guard currentSlot != length else {
        print(arr.map {String($0)}.joined(separator: " "))
        return
    }

    for next in 1...max where !isUsed[next - 1] {
        isUsed[next - 1] = true
        arr[currentSlot] = next
        dfs(currentSlot + 1)
        isUsed[next - 1] = false
    }
}
