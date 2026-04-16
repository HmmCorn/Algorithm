// 백준 - 11779 최소 비용 구하기 2

let cityCount = Int(readLine()!)!
let busCount = Int(readLine()!)!
var graph = [[(next: Int, weight: Int)]](repeating: [], count: cityCount+1)

for _ in (1...busCount) {
    let bus = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[bus[0]].append((bus[1], bus[2]))
}

let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let start = line[0]; let end = line[1]
let INF = 1_000_000_000

var previous = [Int](repeating: 0, count: cityCount+1)
var dist = [Int](repeating: INF, count: cityCount+1)
dist[start] = 0

var heap = Heap<(next: Int, weight: Int)> {$0.weight < $1.weight}
heap.push((start, 0))

while !heap.isEmpty {
    let (current, currentWeight) = heap.pop()!
    if currentWeight > dist[current] { continue }
    for (next, weight) in graph[current] {
        let newWeight = currentWeight + weight
        if newWeight < dist[next] {
            dist[next] = newWeight
            previous[next] = current
            heap.push((next, newWeight))
        }
    }
}

var path = [Int]()
var node = end

while node != start {
    path.append(node)
    node = previous[node]
}
path.append(start)
path.reverse()

print(dist[end])
print(path.count)
print(path.map { String($0) }.joined(separator: " "))


struct Heap<T> {
    var elements: [T]
    var priority: (T, T) -> Bool

    var count: Int { elements.count }
    var isEmpty: Bool { elements.isEmpty }

    init(_ elements: [T] = [], priority: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priority = priority
        heapify()
    }

    func leftChildIndex(of index: Int) -> Int { (2 * index) + 1 }

    func rightChildIndex(of index: Int) -> Int { (2 * index) + 2 }

    func parentIndex(of index: Int) -> Int { (index - 1) / 2 }

    mutating func push(_ item: T) {
        elements.append(item)
        siftUp(count - 1)
    }

    mutating func pop() -> T? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let popped = elements.removeLast()
        if !isEmpty { siftDown(0) }
        return popped
    }

    private mutating func heapify() {
        guard !isEmpty else { return }

        for i in stride(from: count / 2 - 1, through: 0, by: -1) {
            siftDown(i)
        }
    }

    private mutating func siftDown(_ x: Int) {
        var parentIndex = x
        
        while true {
            let left = leftChildIndex(of: parentIndex)
            let right = rightChildIndex(of: parentIndex)
            var candidateIndex = parentIndex

            if left < count, priority(elements[left], elements[candidateIndex]) {
                candidateIndex = left
            }
            if right < count, priority(elements[right], elements[candidateIndex]) {
                candidateIndex = right
            }
            if parentIndex == candidateIndex { break }
            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }

    private mutating func siftUp(_ x: Int) {
        var childIndex = x
        let child = elements[childIndex]

        while childIndex > 0 {
            let parentIndex = parentIndex(of: childIndex)
            let parent = elements[parentIndex]

            if priority(parent, child) { break }

            elements[childIndex] = parent
            childIndex = parentIndex
        }

        elements[childIndex] = child
    }
}
