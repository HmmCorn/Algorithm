/**
주사위: 지도 위 윗면 1, 동쪽 바라보는 방향 3, 놓여진 곳 (x, y)
- 맨 처음 주사위는 모든 면에 0

지도 칸에는 정수 -> 이동한 칸에 쓰여 있는 수가 0이면, 주사위의 바닥면에 쓰인 수가 칸에 복사

주사위를 놓은 곳의 좌표, 이동 명령 -> 주사위 이동마다 상단에 쓰인 값

주사위 굴리기
1. 이동한 좌표 구하기 (x, y) + ()
1.1 지도 내부 검증
2. 좌표 갱신
3. 주사위 출력
*/

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m, k) = (input[0], input[1], input[4])
var dicePosition = (input[2], input[3])
var map = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    map.append(input)
}

// 동: 1, 서: 2, 북: 3, 남: 4
let commands = readLine()!.split(separator: " ").compactMap { Int($0) }
let delta = [(0, 1), (0, -1), (-1, 0), (1, 0)]
var dice = Dice(0, 0, 0, 0, 0, 0)

for command in commands {
    let d = delta[command - 1]
    let newPosition = (dicePosition.0 + d.0, dicePosition.1 + d.1)

    guard (0..<n).contains(newPosition.0) && (0..<m).contains(newPosition.1) else { continue }
    dice = dice.move(command)
    dicePosition = newPosition

    let num = map[newPosition.0][newPosition.1]

    if num == 0 {
        map[newPosition.0][newPosition.1] = dice.bottom
    } else {
        dice.bottom = num
        map[newPosition.0][newPosition.1] = 0
    }

    print(dice.top)
}

struct Dice {
    var left: Int
    var right: Int
    var top: Int
    var bottom: Int
    var front: Int
    var back: Int

    init(_ left: Int, _ right: Int, _ top: Int, _ bottom: Int, _ front: Int, _ back: Int) {
        self.left = left
        self.right = right
        self.top = top
        self.bottom = bottom
        self.front = front
        self.back = back
    }

    func move(_ delta: Int) -> Dice {
        switch delta {
        case 1: return moveEast()
        case 2: return moveWest()
        case 3: return moveNorth()
        case 4: return moveSouth()
        default: return self
        }
    }

    private func moveEast() -> Dice {
        Dice(bottom, top, left, right, front, back)
    }

    private func moveWest() -> Dice {
        Dice(top, bottom, right, left, front, back)
    }

    private func moveNorth() -> Dice {
        Dice(left, right, front, back, bottom, top)
    }

    private func moveSouth() -> Dice {
        Dice(left, right, back, front, top, bottom)
    }
}
