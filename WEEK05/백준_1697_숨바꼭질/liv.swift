// 백준 - 1697 숨바꼭질

let line = readLine()!.split(separator: " ").map { Int($0)! }
let start: Int = line[0]
let target: Int = line[1]

var visited: Set<Int> = []
var queue: [(Int, Int)] = [(start, 0)]
var head: Int = 0

while head < queue.count {
    let (current, count) = queue[head]
    head += 1

    guard current != target else {
        print(count)
        break
    }

    let nextPositions = [current - 1, current + 1, current * 2]

    for next in nextPositions where next >= 0 && next <= 100000 && !visited.contains(next) {
        visited.insert(next)
        queue.append((next, count + 1))
    }
}
