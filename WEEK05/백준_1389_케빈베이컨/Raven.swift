struct Queue<T> {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []

    var isEmpty: Bool { return enqueueStack.isEmpty && dequeueStack.isEmpty }

    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }

    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let uc = input[0]
let rc = input[1]
var rm:[[Bool]] = Array(repeating: Array(repeating: false, count: uc), count: uc)

for _ in 0..<rc {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    rm[input[0] - 1][input[1] - 1] = true
    rm[input[1] - 1][input[0] - 1] = true
}

var count: Int = uc * uc
var number: Int = uc

for i in 0..<uc {
    let cc = bfs(i, 0)
    if cc < count {
        number = i
        count = cc
    }
}

print(number + 1)

func bfs(_ start: Int, _ depth: Int) -> Int {
    var queue = Queue<(Int, Int)>()
    var count: Int = 0
    var visited = Array(repeating: false, count: uc)
    visited[start] = true
    queue.enqueue((start, depth))
    
    while !queue.isEmpty {
        let current = queue.dequeue()!

        for i in 0..<uc where rm[current.0][i] && !visited[i] {
            visited[i] = true
            queue.enqueue((i, current.1 + 1))
            count += current.1 + 1
        }
    }
    return count
}
