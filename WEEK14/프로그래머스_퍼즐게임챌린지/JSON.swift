import Foundation

/**
- 숙련도에 따라 퍼즐 풀 때 틀리는 횟수 변경

limit: 전체 게임 제한 시간
- 제한 시간 내에 퍼즐을 모두 해결하기 위한 숙련도의 최솟값
*/

/// diff: 현재 퍼즐 난이도, time_cur: 현재 퍼즐의 소요 시간, level: 숙련도
func solution(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
    var (l, r) = (1, diffs.max()!)

    while l <= r {
        let level = (l + r) / 2
        var total: Int64 = 0
        var prevTime = 0

        for (diff, curTime) in zip(diffs, times) {
            if diff <= level {
                total += Int64(curTime)
            } else {
                let count = diff - level
                total += Int64((prevTime + curTime) * count + curTime)
            }
            prevTime = curTime
        }

        if total > limit {
            l = level + 1
        } else {
            r = level - 1
        }
    }


    return l
}
