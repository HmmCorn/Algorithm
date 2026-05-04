import Foundation

func solution(_ diffs: [Int], _ times: [Int], _ limit: Int64) -> Int {
    let puzzleCount = diffs.count

    var left = 1
    var right = diffs.max()!
    var result = right

    while left <= right {
        let mid = (left + right) / 2

        var total = 0

        for i in 0..<puzzleCount {
            if diffs[i] <= mid {
                total += times[i]
            } else {
                let prev = i > 0 ? times[i-1] : 0
                total += (prev + times[i]) * (diffs[i] - mid) + times[i]
            }

            if total > limit { break }
        }

        if total <= limit {
            result = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return result
}
