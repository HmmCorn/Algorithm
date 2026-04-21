let nmxyk = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m, x, y, k) = (nmxyk[0], nmxyk[1], nmxyk[2], nmxyk[3], nmxyk[4])

var map: [[Int]] = []
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").compactMap { Int($0) }
    map.append(row)
}

// 동1 서2 북3 남4
let moves = readLine()!.split(separator: " ").compactMap { Int($0) }
let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

// 위, 아래, 동, 서, 남, 북
var dice: [Int] = [0, 0, 0, 0, 0, 0]

var position = (x: x, y: y)

for move in moves {
    let nx = position.x + dx[move - 1]
    let ny = position.y + dy[move - 1]

    // 범위 체크
    if nx < 0 || ny < 0 || nx >= n || ny >= m {
        continue
    }

    // 이동
    position = (nx, ny)

    let temp = dice

    switch move {
    // 동
    case 1:
        dice[0] = temp[3]
        dice[1] = temp[2]
        dice[2] = temp[0]
        dice[3] = temp[1]
    // 서
    case 2:
        dice[0] = temp[2]
        dice[1] = temp[3]
        dice[2] = temp[1]
        dice[3] = temp[0]
    // 북
    case 3:
        dice[0] = temp[4]
        dice[1] = temp[5]
        dice[4] = temp[1]
        dice[5] = temp[0]
    // 남
    case 4:
        dice[0] = temp[5]
        dice[1] = temp[4]
        dice[4] = temp[0]
        dice[5] = temp[1]

    default:
        break
    }

    // 지도, 주사위 정리
    if map[position.x][position.y] == 0 {
        map[position.x][position.y] = dice[1]
    } else {
        dice[1] = map[position.x][position.y]
        map[position.x][position.y] = 0
    }

    print(dice[0])
}
