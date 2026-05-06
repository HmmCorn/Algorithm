import Foundation

func solution(_ m:Int, _ n:Int, _ h:Int, _ w:Int, _ drops:[[Int]]) -> [Int] {
    var times = Array(repeating: Array(repeating: Int.max, count: n), count: m)
    
    for (i, d) in drops.enumerated() {
        let or = d[0]
        let oc = d[1]
        for r in ((or - (h - 1))...(or + h - 1)) where r < m && r >= 0 {
            for c in ((oc - (w - 1))...(oc + w - 1)) where c < n && c >= 0 {
                if times[r][c] == Int.max {
                    times[r][c] = i + 1
                }
            }
        }
    }
    for r in times { print(r) }
    return []
}
