class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {

        let n = intervals.count

        let sortedIntervals = intervals.sorted {
            if $0[1] == $1[1] {
                return $0[0] < $1[0]
            }
            return $0[1] < $1[1]
        }

        var select = 0
        var currentEnd = -5 * 10 * 10 * 10 * 10

        for interval in sortedIntervals {
            let start = interval[0]
            let end = interval[1]

            if start >= currentEnd {
                select += 1
                currentEnd = end
            }
        }

        return n - select
    }
}
