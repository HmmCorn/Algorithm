// O(MN) = 1,000,000

let mn = readLine()!.split(separator: " ").compactMap { Int($0) }
let (m, n) = (mn[0], mn[1])
var board = [[Int]]()
var queue = Queue()
let directions = [(-1, 0), (1, 0), (0, 1), (0, -1)]
var result = 0

for r in 0..<n {
    let row = readLine()!.split(separator: " ").compactMap { Int($0) }
    row.enumerated().filter { $1 == 1 }.forEach { queue.enqueue((r, $0.0, 0)) }
    board.append(row)
}

while !queue.isEmpty {
    let (cr, cc, cd) = queue.dequeue()
    result = cd

    for (dr, dc) in directions {
        let nr = cr + dr
        let nc = cc + dc
        let nd = cd + 1

        guard nr >= 0, nr < n, nc >= 0, nc < m, board[nr][nc] == 0 else { continue }
        queue.enqueue((nr, nc, nd))
        board[nr][nc] = 1
    }
}

let isValid = !board.flatMap { $0 }.contains(0)
print(isValid ? result : -1)

struct Queue {
    typealias Element = (Int, Int, Int)

    var inputStack = [Element]()
    var outputStack = [Element]()
    var isEmpty: Bool { inputStack.isEmpty && outputStack.isEmpty }
    var count: Int { inputStack.count + outputStack.count }

    mutating func enqueue(_ element: Element) {
        inputStack.append(element)
    }

    mutating func dequeue() -> Element {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        return outputStack.removeLast()
    }
}
