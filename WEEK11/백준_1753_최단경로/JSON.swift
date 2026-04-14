let ve = readLine()!.split(separator: " ").compactMap { Int($0) }
let (v, e) = (ve[0], ve[1])
let k = Int(readLine()!)!
var graph = [[(w: Int, v: Int)]](repeating: [], count: v + 1)

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]].append((input[2], input[1]))
}

var dists = [Int](repeating: Int.max, count: v + 1)
var heap = Heap<(w: Int, v: Int)> { $0.w < $1.w }
heap.push((0, k))
dists[k] = 0

while let (curDist, curValue) = heap.pop() {
    guard dists[curValue] == curDist else { continue }

    for (nextWeight, nextValue) in graph[curValue] {
        let nextDist = curDist + nextWeight
        if nextDist < dists[nextValue] {
            heap.push((nextDist, nextValue))
            dists[nextValue] = nextDist
        }
    }
}

for i in 1...v {
    let dist = dists[i]
    print(dist == Int.max ? "INF" : dist)
}

struct Heap<T> {
    var elements: [T]
    let priority: (T, T) -> Bool

    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }

    init(_ priority: @escaping (T, T) -> Bool) {
        self.elements = []
        self.priority = priority
    }

    mutating func push(_ element: T) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }

    mutating func pop() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let removed = elements.removeLast()
        siftDown(from: 0)
        return removed
    }

    private mutating func siftUp(from index: Int) {
        var newIndex = index
        var parent = (index - 1) / 2

        while newIndex > 0 && priority(elements[newIndex], elements[parent]) {
            elements.swapAt(newIndex, parent)
            newIndex = parent
            parent = (newIndex - 1) / 2
        }
    }

    private mutating func siftDown(from index: Int) {
        var parent = index

        while true {
            let left = parent * 2 + 1
            let right = parent * 2 + 2
            var candidate = parent

            if left < elements.count && priority(elements[left], elements[parent]) {
                candidate = left
            }
            if right < elements.count && priority(elements[right], elements[candidate]) {
                candidate = right
            }

            guard candidate != parent else { break }
            elements.swapAt(candidate, parent)
            parent = candidate
        }
    }
}
