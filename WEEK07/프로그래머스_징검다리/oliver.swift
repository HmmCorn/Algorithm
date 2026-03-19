import Foundation

func solution(_ distance: Int, _ rocks: [Int], _ n: Int) -> Int {
    var rocks = rocks.sorted()
    rocks.append(distance)

    var start = 1
    var end = distance

    while start <= end {

        // 모든 돌 사이의 거리가 mid 이상이 되도록 만들 수 있나
        let mid = (start + end) / 2

        var removeCount = 0
        var prev = 0
        for rock in rocks {
            let gap = rock - prev

            if gap < mid {
                removeCount += 1
            } else {
                prev = rock
            }
        }
        
        if removeCount <= n {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }

    return end
}
