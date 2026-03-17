// 백준 - 2805 나무 자르기

// let M = readLine()!.split(separator: " ").compactMap { Int($0) }[1] <- 20ms 증가
let firstLine = readLine()!.split(separator: " ").compactMap { Int($0) }
let trees = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted { $0 < $1 }
let M = firstLine[1]

// 적어도 M을 가져가기 위한 절단기 높이 최댓값
// -> 높이를 X만큼 설정했을 때 M만큼 잘리는가?
// X가 커질수록 M은 줄어든다

func binarySearch() -> Int {
    var (start, end, available) = (0, 2000000000, 0)

    while start <= end {
        let target = (start + end) / 2
        let rest = trees.reduce(0) { $0 + max(0, $1 - target) }
        
        if rest == M { return target }
        else if rest < M { end = target - 1 }
        else {
            start = target + 1
            available = target
        }
    }
    return available
}

print(binarySearch())
