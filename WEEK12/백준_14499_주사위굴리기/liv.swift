// 백준 - 14499 주사위 굴리기

let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = line[0]; let m = line[1]; let x = line[2]; let y = line[3]

var map = [[Int]]()
for _ in 1...n { map.append(readLine()!.split(separator: " ").compactMap { Int($0) }) }

let orders = readLine()!.split(separator: " ").compactMap { Int($0) }
let directions = [(0, 1), (0, -1), (-1, 0), (1,0)]

var dice = [Int](repeating: 0, count: 6)
var coord: (r: Int, c: Int) = (x, y)
var result = [String]()

for order in orders {
    // 지도 다음 칸 찾기
    let direction = directions[order-1]
    let next: (r: Int, c: Int) = (coord.r+direction.0, coord.c+direction.1)
    
    // 다음 칸의 숫자 확인
    guard next.r >= 0 && next.r < n && next.c >= 0 && next.c < m else { continue }
    coord = next

    // 주사위 굴리기
    roll(order)

    if map[coord.r][coord.c] == 0 {
        map[coord.r][coord.c] = dice[5]
    } else {
        dice[5] = map[coord.r][coord.c]
        map[coord.r][coord.c] = 0
    }

    result.append(String(dice[0]))
}

print(result.joined(separator: "\n"))

func roll(_ order: Int) {
    let temp = dice
    
    switch order {
    case 1:
        dice[0] = temp[3]
        dice[2] = temp[0]
        dice[5] = temp[2]
        dice[3] = temp[5]
        
    case 2:
        dice[0] = temp[2]
        dice[3] = temp[0]
        dice[5] = temp[3]
        dice[2] = temp[5]
        
    case 3:
        dice[0] = temp[4]
        dice[1] = temp[0]
        dice[5] = temp[1]
        dice[4] = temp[5]
        
    case 4:
        dice[0] = temp[1]
        dice[4] = temp[0]
        dice[5] = temp[4]
        dice[1] = temp[5]
        
    default:
        break
    }
}
