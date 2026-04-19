let n = Int(readLine()!)!
let m = Int(readLine()!)!
let MAX = 100_000 * m + 1

var graph = [[(w: Int, v: Int)]](repeating: [], count: n + 1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]].append((input[2], input[1]))
}

let se = readLine()!.split(separator: " ").compactMap { Int($0) }
let (s, e) = (se[0], se[1])

var table = [Int](repeating: MAX, count: n + 1)
var pre = [Int](repeating: 0, count: n + 1)
var heap = Heap<(w: Int, v: Int)> { $0 < $1 }
table[s] = 0
heap.push((0, s))

while let (curDist, curNode) = heap.pop() {
    guard curDist == table[curNode] else { continue }

    for (nextWeight, nextNode) in graph[curNode] {
        let nextDist = nextWeight + curDist
        if nextDist < table[nextNode] {
            heap.push((nextDist, nextNode))
            table[nextNode] = nextDist
            pre[nextNode] = curNode
        }
    }
}

var path = [Int]()
var cur = e

while true {
    if cur == 0 { break }
    path.append(cur)
    cur = pre[cur]
}

print(table[e])
print(path.count)
print(path.reversed().map { String($0) }.joined(separator: " "))

struct Heap<T> {
    private let priority: (T, T) -> Bool
    var elements: [T] = []

    var count: Int { elements.count }
    var isEmpty: Bool { elements.isEmpty }

    init(_ priority: @escaping (T, T) -> Bool) {
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
        var newNode = index
        var parent = (index - 1) / 2

        while newNode > 0 && priority(elements[newNode], elements[parent]) {
            elements.swapAt(newNode, parent)
            newNode = parent
            parent = (newNode - 1) / 2
        }
    }

    private mutating func siftDown(from index: Int) {
        var parent = index

        while true {
            let (left, right) = (parent * 2 + 1, parent * 2 + 2)
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
