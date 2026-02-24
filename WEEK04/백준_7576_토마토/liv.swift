// 백준 - 7576 토마토

import Foundation

// [A] 모든 토마토가 익어있는 상태: 0이 없을 때
// [B] 토마토가 모두 익지는 못하는 상황:
    // 1. 1이 없을 때
    // 2. -1로만 둘러쌓인 0이 존재할 때

// M, N 읽기
let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let M = firstLine[0] // 가로
let N = firstLine[1] // 세로

// 그리드 읽기
var box = [[Int]]()
var noRipe: Bool = true
var allRipe: Bool = true

for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    if row.contains(1) { noRipe = false }
    if row.contains(0) { allRipe = false }
    box.append(row)
}

// 결과 확인 함수
func printResult() {
    var step: Int = 0

    for line in box {
        // 토마토가 모두 익지 못하는 상황 2
        guard !line.contains(0) else {
            print(-1)
            return
        }
        let max = line.max() ?? 0
        step = step < max ? max : step
    }
    // 루트 노드가 1이었으므로 1 빼기
    print(step - 1)
}

// 토마토가 모두 익지 못하는 상황 1 
if noRipe { print(-1) }
// 모든 토마토가 익어있는 상태
else if allRipe { print(0) }
else {
    // 현재 위치 값에 더해서 이동할 값들 (4방향)
    let nextDirection = [(-1, 0), (0, -1), (0, +1), (+1, 0)]
    var head: Int = 0
    var queue: [(Int, Int)] = []
    
    // 익은 토마토만 찾아서 큐에 등록
    for row in 0..<N {
        for col in 0..<M {
            if box[row][col] == 1 {
                queue.append((row, col))
            }
        }
    }
    
    // 헤드 포인터를 기준으로 배열을 큐처럼 사용
    while head < queue.count {
        let (row, col) = queue[head]
        head += 1
    
        for d in 0..<4 {
            // 방향 이동
            let (nextRow, nextCol) = (nextDirection[d].0 + row, nextDirection[d].1 + col)
            // 박스 밖으로 나가는지 검사
            guard nextRow >= 0,
                nextCol >= 0,
                nextRow < N,
                nextCol < M
            else { continue }

            // 익지 않은 토마토로만 노드 이동
            guard box[nextRow][nextCol] == 0 else { continue }

            // (부모 노드의 값 + 1)을 더해서 depth 계산
            box[nextRow][nextCol] = box[row][col] + 1
            // 이제 익은 토마토니까 큐에 등록
            queue.append((nextRow, nextCol))
        }
    }
    printResult()
}
