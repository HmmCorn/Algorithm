let n = Int(readLine()!)!
var rooms = [(start: Int, end: Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    rooms.append((input[0], input[1]))
}

// 회의 종료 시간이 빠른 순으로 정렬. 종료 시간이 같다면 시작 시간이 뒤인 순으로 정렬.
// a_i가 a_k보다 회의 종료 시간이 빠르다 == 시작 시간이 빠르다 or 회의 시간이 짧다
rooms = rooms.sorted {
    $0.end == $1.end ? $0.start < $1.start : $0.end < $1.end
}

var result = 0
var lastEnd = 0

for (start, end) in rooms {
    guard start >= lastEnd else { continue }
    result += 1
    lastEnd = end
}

print(result)
