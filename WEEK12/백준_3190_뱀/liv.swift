// 백준 - 3190 뱀

var apples = Set<[Int]>()
var turnInfo = [Int: String]()

let n = Int(readLine()!)!

let appleCount = Int(readLine()!)!
if appleCount > 0 {
    for _ in 1...appleCount {
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        apples.insert(line)
    }
}

let turnCount = Int(readLine()!)!
for _ in 1...turnCount {
    let line = readLine()!.split(separator: " ")
    if let sec = Int(line[0]) { turnInfo[sec] = String(line[1]) }
}

let directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
var direction = 0 // 0: 우, 1: 하, 2: 좌, 3: 상

var count = 0
var snake = [[Int]]()
// var snake = Set<[Int]>()
snake.append([1,1])

while true {
    count += 1

    let head = snake.last!
    let next = [head[0]+directions[direction][0], head[1]+directions[direction][1]]

    if snake.contains(next) || !next.allSatisfy({ $0 >= 1 && $0 <= n }) { break }

    if apples.contains(next) { apples.remove(next) }
    else { snake.removeFirst() }
    
    snake.append(next)

    if let turn = turnInfo[count] {
        if turn == "L" { let next = direction - 1; direction = next < 0 ? 3 : next }
        if turn == "D" { let next = direction + 1; direction = next > 3 ? 0 : next }
    }
}

print(count)
