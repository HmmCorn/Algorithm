// MARK: - Helpers

func changeDirection(_ char: String, _ direction: Int) -> Int {
    if char == "L" {
        return direction == 0 ? 3 : direction - 1
    } else {
        return (direction + 1) % 4
    }
}

func isValidate(_ coord: (r: Int, c: Int)) -> Bool {
    // 1. 벽 체크
    guard (0..<n).contains(coord.r) && (0..<n).contains(coord.c) else { return false }

    // 2. 몸 체크
    guard board[coord.r][coord.c] != "s" else { return false }

    return true
}

// MARK: - 입력

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var board = [[String]](repeating: [String](repeating: ".", count: n), count: n)
board[0][0] = "s"

for _ in 0..<k {
    let rc = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (r, c) = (rc[0] - 1, rc[1] - 1)
    board[r][c] = "a"
}

let l = Int(readLine()!)!
var directions = [(Int, String)]()
for _ in 0..<l {
    let xc = readLine()!.split(separator: " ").map { String($0) }
    directions.append((Int(xc[0])!, xc[1]))
}

// MARK: - 실행

var time = 1
var delta: [(r: Int, c: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)] // 우, 하, 좌, 상
var moves: [(r: Int, c: Int)] = [(0, 0)]
var headDir = 0

while true {
    // 1. 새로운 머리 위치 계산
    guard let head = moves.last else { break }
    let newHead = (r: head.r + delta[headDir].r, c: head.c + delta[headDir].c)

    // 2. 벽, 몸 범위 검증
    guard isValidate(newHead) else { break }

    // 3. 사과 체크
    if board[newHead.r][newHead.c] != "a" {
        // 3.1 사과 없음 -> 꼬리 이동
        let tail = moves.removeFirst()
        board[tail.r][tail.c] = "."
    }

    // 4. 머리 이동
    moves.append(newHead)
    board[newHead.r][newHead.c] = "s"

    // 5. 방향 변환
    if let (t, c) = directions.first, time == t {
        directions.removeFirst()
        headDir = changeDirection(c, headDir)
    }

    time += 1
}

print(time)
