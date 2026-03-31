func solution(_ meetings: [(start: Int, end: Int)]) -> Int {

    // 이거 아님
    // meetings를 정렬 
    // - 1. 시작시간 순서
    // - 2. 시작시간이 같으면, 회의 시간(끝 - 시작)이 짧은 순서
    // 예외 케이스: 백준 예시

    // 이거 아님
    // meetings를 정렬
    // - 1. 끝나는시간 순서
    // - 2. 끝나는시간이 같으면, 회의 시간(끝 - 시작)이 짧은 순서 (즉 시작시간이 큰 순서)
    // 예외 케이스: [(1, 4), (2, 4), (4, 4) (4, 5)]

    // meetings를 정렬
    // - 1. 끝나는시간 순서
    // - 2. 끝나는시간이 같으면, 회의 시간(끝 - 시작)이 긴 순서 (즉 시작시간이 작은 순서)

    let meetings = meetings.sorted {
        if $0.end == $1.end {
            return $0.start < $1.start
        }
        return $0.end < $1.end
    }

    var result = 0
    var nowTime = 0

    for meeting in meetings {
        if meeting.start >= nowTime {
            result += 1
            nowTime = meeting.end
        }
    }

    return result
}

let n = Int(readLine()!)!

var meetings: [(start: Int, end: Int)] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    meetings.append((start: input[0], end: input[1]))
}

print(solution(meetings))
