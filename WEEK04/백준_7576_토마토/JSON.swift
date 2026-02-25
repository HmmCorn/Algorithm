import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (colCount, rowCount) = (nm[0], nm[1])

var grid = [[Int]]()
for _ in 0..<rowCount {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    grid.append(input)
}

let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]
var vis = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)

var queue = [(Int, Int)]()
var queueIdx = 0

var notRipenCount = 0    // 초기에 익지 않은 토마토 == 익어야 할 토마토
var ripedCount = 0       // 영향을 받아 익은 토마토
var result = 0

for row in 0..<rowCount {
    for col in 0..<colCount {
        // 익은 토마토 큐에 추가
        if grid[row][col] == 1 {
            queue.append((row, col))
            vis[row][col] = 0
        }

        // 익지 않은 토마토 카운트
        if grid[row][col] == 0 {
            notRipenCount += 1
        }
    }
}

while queueIdx < queue.count {
    let (curRow, curCol) = queue[queueIdx]
    queueIdx += 1

    if notRipenCount == ripedCount {
        result = vis[curRow][curCol]
    }

    for i in 0..<4 {
        let (nextRow, nextCol) = (curRow + dRow[i], curCol + dCol[i])
        guard (0..<rowCount).contains(nextRow) && (0..<colCount).contains(nextCol) else { continue }
        guard vis[nextRow][nextCol] == -1 && grid[nextRow][nextCol] == 0 else { continue }
        queue.append((nextRow, nextCol))
        vis[nextRow][nextCol] = vis[curRow][curCol] + 1
        ripedCount += 1
    }
}

if notRipenCount == ripedCount {
    print(result)
} else {
    print(-1)
}



