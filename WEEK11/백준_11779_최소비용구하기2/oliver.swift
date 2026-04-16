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
            let parentIndex = (childIndex - 1) / 2
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
            let leftIndex = parentIndex * 2 + 1
            let rightIndex = parentIndex * 2 + 2
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

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph: [[(node: Int, weight: Int)]] = Array(repeating: [], count: n+1)
for _ in 0..<m {
    let startEndWeight = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (start, end, weight) = (startEndWeight[0], startEndWeight[1], startEndWeight[2])

    graph[start].append((node: end, weight: weight))
}

let startEnd = readLine()!.split(separator: " ").compactMap { Int($0) }
let (start, end) = (startEnd[0], startEnd[1])

var dist = Array(repeating: Int.max, count: n+1)
dist[start] = 0

var pq = Heap<(Int, Int)> { $0.0 < $1.0 }
pq.push((0, start))

var prev = Array(repeating: 0, count: n+1)

while !pq.isEmpty {
    guard let (cost, current) = pq.pop() else { break }

    if dist[current] < cost { continue }

    for (next, weight) in graph[current] {
        let newCost = cost + weight

        if dist[next] > newCost {
            dist[next] = newCost
            prev[next] = current
            pq.push((newCost, next))
        }
    }
}

var path: [Int] = []
var current = end

while current != 0 {
    path.append(current)
    current = prev[current]
}

path.reverse()
print(dist[end])
print(path.count)
print(path.map { String($0) }.joined(separator: " "))
