// 백준 - 1931 회의실 배정

let meetingCount = Int(readLine()!)!
var meetings: [(Int, Int)] = []

for _ in 0..<meetingCount {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    meetings.append((line[0], line[1]))
}

meetings.sort { first, second in
    if first.1 != second.1 { return first.1 < second.1 }
    return first.0 < second.0
}

var previous = 0
var count = 0
for meeting in meetings where meeting.0 >= previous {
    previous = meeting.1
    count += 1
}

print(count)
