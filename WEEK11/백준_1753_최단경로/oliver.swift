// 힙
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

// main
let ve = readLine()!.split(separator: " ").compactMap { Int($0) }
let (v, e) = (ve[0], ve[1])
let k = Int(readLine()!)!

var graph: [[(node: Int, weight: Int)]] = Array(repeating: [], count: v+1)
for _ in 0..<e {
    let uvw = readLine()!.split(separator: " ").compactMap { Int($0)}
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    graph[u].append((node: v, weight: w))
}

var dist = Array(repeating: Int.max, count: v+1)
dist[k] = 0

var pq = Heap<(dist: Int, node: Int)>(priority: { $0.dist < $1.dist })
pq.push((dist: 0, node: k))

while !pq.isEmpty {
    guard let (currentDist, u) = pq.pop() else { break }
    if currentDist > dist[u] { continue }

    for (next, weight) in graph[u] {
        let newDist = dist[u] + weight
        if newDist < dist[next] {
            dist[next] = newDist
            pq.push((dist: newDist, node: next))
        }
    }
}

// 출력
for i in 1...v {
    if dist[i] == Int.max {
        print("INF")
    } else{
        print(dist[i])
    }
}
