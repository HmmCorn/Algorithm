// 0: 빈 공간, 1: 사과, 2: 뱀
let n = Int(readLine()!)!
var grid: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
grid[1][1] = 2

// 사과 입력
let k = Int(readLine()!)!
for _ in 0..<k {
    let apples = readLine()!.split(separator: " ").compactMap { Int($0) }
    grid[apples[0]][apples[1]] = 1
}

// 방향전환 입력
let l = Int(readLine()!)!
var moves: [Int: String] = [:]
for _ in 0..<l {
    let xc = readLine()!.split(separator: " ").compactMap { String($0) }
    moves[Int(xc[0])!] = xc[1]
}

// 상 우 하 좌
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

var nowDir = 1
var time = 0
var snake: [(Int, Int)] = [(1, 1)]

while true {
    time += 1
    let head = snake.last!

    // 다음 칸 계산
    let nx = dx[nowDir] + head.0
    let ny = dy[nowDir] + head.1

    // 벽or몸에 부딪히면 끝
    if nx < 1 || ny < 1 ||
       nx > n || ny > n ||
       grid[nx][ny] == 2
    {
        print(time)
        break
    }

    // 사과 판단
    if grid[nx][ny] == 1 {
        grid[nx][ny] = 2
        snake.append((nx, ny))
    } else {
        grid[nx][ny] = 2
        snake.append((nx, ny))

        let tail = snake.removeFirst()
        grid[tail.0][tail.1] = 0
    }

    // 방향 전환 처리
    if let move = moves[time] {
        if move == "D" { // 오른쪽 90도
            nowDir = (nowDir + 1) % 4
        } else { // 왼쪽 90도
            nowDir = (nowDir + 3) % 4
        }
    }
}
