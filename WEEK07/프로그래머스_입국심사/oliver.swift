import Foundation

func solution(_ n: Int, _ times: [Int]) -> Int {

    // 최소 시간 찾기
    // 1 ~ times.max() * n 범위 안에서

    var start = 1
    var end = times.max()! * n
    var answer = end

    while start <= end {
        let mid = (start + end) / 2

        var canProcessCount = 0
        for time in times {
            canProcessCount += mid / time
        }

        if canProcessCount < n {
            start = mid + 1
        } else {
            answer = mid
            end = mid - 1
        }
    }

    return answer
}
