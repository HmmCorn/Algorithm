let firstLine = readLine()!.split(separator: " ").compactMap { Int($0) }
let vertexCount = firstLine[0]
let edgeCount = firstLine[1]
let start = Int(readLine()!)!

var graph = [[(node: Int, weight: Int)]](repeating: [], count: vertexCount + 1)
for _ in 0..<edgeCount {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[line[0]].append((line[1], line[2]))
}

var result = [Int](repeating: Int.max, count: vertexCount + 1)
result[start] = 0

var heap = Heap<(node: Int, weight: Int)>(priority: {$0.weight < $1.weight})
heap.push((start, 0))

while !heap.isEmpty {
    let (current, currentWeight) = heap.pop()!
    if currentWeight > result[current] { continue }
    for (next, weight) in graph[current] {
        let newWeight = currentWeight + weight
        if newWeight < result[next] {
            result[next] = newWeight
            heap.push((next, newWeight))
        }
    }
}

print((1...vertexCount).map { result[$0] == Int.max ? "INF" : String(result[$0]) }.joined(separator: "\n"))

struct Heap<T> {
    var elements: [T]
    var priority: (T, T) -> Bool

    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }

    init(elements: [T] = [], priority: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priority = priority
        heapify()
    }

    func leftChildIndex(of index: Int) -> Int { return (2 * index) + 1 }

    func rightChildIndex(of index: Int) -> Int { return (2 * index) + 2 }

    func parentIndex(of index: Int) -> Int { return (index - 1) / 2 }

    private mutating func heapify() {
        guard !isEmpty else { return }
        for i in stride(from: count / 2 - 1, through: 0, by: -1) {
            siftDown(i)
        }
    }

    mutating func push(_ element: T) {
        elements.append(element)
        siftUp(count - 1)
    }

    mutating func pop() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let popped = elements.removeLast()
        if !elements.isEmpty { siftDown(0) }
        return popped
    }

    private mutating func siftUp(_ x: Int) {
        var childIndex = x
        let child = elements[x]

        while childIndex > 0 {
            let parentIndex = parentIndex(of: childIndex)
            let parent = elements[parentIndex]

            if priority(parent, child) { break }

            elements[childIndex] = parent
            childIndex = parentIndex
        }

        elements[childIndex] = child
    }

    private mutating func siftDown(_ x: Int) {
        var parentIndex = x

        while true {
            let leftIndex = leftChildIndex(of: parentIndex)
            let rightIndex = rightChildIndex(of: parentIndex)
            var candidateIndex = parentIndex

            if leftIndex < count, priority(elements[leftIndex], elements[candidateIndex]) {
                candidateIndex = leftIndex
            }
            if rightIndex < count, priority(elements[rightIndex], elements[candidateIndex]) {
                candidateIndex = rightIndex
            }
            if parentIndex == candidateIndex { break }
            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}
