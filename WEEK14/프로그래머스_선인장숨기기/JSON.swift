import Foundation

func solution(_ m:Int, _ n:Int, _ h:Int, _ w:Int, _ drops:[[Int]]) -> [Int] {
    let (rowCount, colCount) = (m, n)
    let (subRowCount, subColCount) = (m - h + 1, n - w + 1)
    var times = [[Int]](repeating: [Int](repeating: Int.max, count: colCount), count: rowCount)

    for (idx, drop) in drops.enumerated() {
        times[drop[0]][drop[1]] = idx + 1
    }

    var rowMins = [[Int]](repeating: [Int](repeating: Int.max, count: subColCount), count: rowCount)

    for r in 0..<rowCount {
        var deque = Deque<(idx: Int, time: Int)>()

        for c in 0..<colCount {
            while !deque.isEmpty && deque.last!.time >= times[r][c] {
                deque.popLast()
            }
            while !deque.isEmpty && deque.first!.idx <= c - w {
                deque.popFirst()
            }
            deque.append((c, times[r][c]))

            if c >= w - 1 {
                rowMins[r][c - w + 1] = deque.first!.time
            }
        }
    }

    var bestTime = -1
    var result = [subRowCount - 1, subColCount - 1]
    for c in 0..<subColCount {
        var deque = Deque<(idx: Int, time: Int)>()

        for r in 0..<rowCount {
            while !deque.isEmpty && deque.last!.time >= rowMins[r][c] {
                deque.popLast()
            }
            while !deque.isEmpty && deque.first!.idx <= r - h {
                deque.popFirst()
            }
            deque.append((r, rowMins[r][c]))

            if r >= h - 1 {
                let winR = r - h + 1
                let winTime = deque.first!.time

                if winTime > bestTime
                || (winTime == bestTime && winR < result[0])
                || (winTime == bestTime && c < result[1]) {
                    bestTime = winTime
                    result = [winR, c]
                }
            }
        }
    }


    return result
}


struct Deque<T> {
    var enqueue: [T] = []
    var dequeue: [T] = []

    var isEmpty: Bool { enqueue.isEmpty && dequeue.isEmpty }
    var count: Int { enqueue.count + dequeue.count }

    var first: T? {
        dequeue.last ?? enqueue.first
    }

    var last: T? {
        enqueue.last ?? dequeue.first
    }

    init(_ queue: [T] = []) {
        self.enqueue = queue
    }

    mutating func prepend(_ val: T) {
        dequeue.append(val)
    }

    mutating func append(_ val: T) {
        enqueue.append(val)
    }

    mutating func popFirst() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }

        return dequeue.popLast()
    }

    mutating func popLast() -> T? {
        if enqueue.isEmpty {
            enqueue = dequeue.reversed()
            dequeue.removeAll()
        }

        return enqueue.popLast()
    }
}
