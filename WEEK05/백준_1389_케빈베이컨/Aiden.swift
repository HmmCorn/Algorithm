struct Queue {
    typealias Element = (Int, Int)

    var inputStack = [Element]()
    var outputStack = [Element]()
    var isEmpty: Bool { inputStack.isEmpty && outputStack.isEmpty }

    mutating func enqueue(_ element: Element) { inputStack.append(element) }
    mutating func dequeue() -> Element {
        if outputStack.isEmpty { 
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        return outputStack.removeLast()
    }
}

let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])

var graph = [Int: [Int]]()
var kevinBacon = [Int](repeating: 5001, count: n + 1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (a, b) = (ab[0], ab[1])
    graph[a, default: []].append(b)
    graph[b, default: []].append(a)
}

for i in 1...n { kevinBacon[i] = bfs(i) }
let minValue = kevinBacon.min()!
print(kevinBacon.firstIndex{ $0 == minValue }! )

func bfs(_ start: Int) -> Int {
    var distances = [Int](repeating: 0, count: n + 1)
    var visited = [Bool](repeating: false, count: n + 1)
    var queue = Queue()
    queue.enqueue((start, 0))
    visited[start] = true

    while !queue.isEmpty {
        let (currentNode, currentDepth) = queue.dequeue()

        for nextNode in graph[currentNode, default: []] where !visited[nextNode] {
            let nextDepth = currentDepth + 1
            queue.enqueue((nextNode, nextDepth))
            visited[nextNode] = true
            distances[nextNode] = nextDepth
        }
    }

    return distances.reduce(0, +)
}
