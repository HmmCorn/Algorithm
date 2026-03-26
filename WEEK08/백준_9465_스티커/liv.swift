// 백준 - 9465 스티커

let caseCount = Int(readLine()!)!

for _ in 0..<caseCount {
    let n = Int(readLine()!)!
    let stickers = [readInts(), readInts()]
    
    print(solution(n, stickers))
}

func solution(_ n: Int, _ stickers: [[Int]]) -> Int {
    var points = stickers

    if n > 1 {
        points[0][1] += points[1][0]
        points[1][1] += points[0][0]
        
        for x in 2..<n {
            points[0][x] += max(points[1][x-1], points[1][x-2])
            points[1][x] += max(points[0][x-1], points[0][x-2])
        }
    }

    return points.flatMap { $0 }.max()!
}

func readInts() -> [Int] {
    readLine()!.split(separator: " ").compactMap { Int($0) }
}
