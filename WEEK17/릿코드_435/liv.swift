// 릿코드 - 435 Non-overlapping Intervals

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var intervals = intervals.sorted { $0[1] < $1[1] }
        var end = Int.min
        var selected = 0

        for interval in intervals where interval[0] >= end {
            selected += 1
            end = interval[1]
        }

        return intervals.count - selected
    }
}
