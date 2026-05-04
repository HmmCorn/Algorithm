// 프로그래머스 - 퍼즐 게임 챌린지

import Foundation

func solution(_ diffs: [Int], _ times: [Int], _ limit: Int64) -> Int {
    
    func getTotalTime(_ level: Int) -> Int64 {
        var total: Int64 = Int64(times[0])
        
        for i in 1..<diffs.count {
            let diff = diffs[i] - level
            let cur = times[i]
            let prev = times[i-1]
            
            if diff <= 0 { total += Int64(cur) }
            else { total += Int64(diff) * Int64(cur + prev) + Int64(cur) }
            
            if total > limit { return total }
        }
        
        return total
    }
    
    var left = 1
    var right = 100000
    
    while left <= right {
        let mid = (left + right) / 2
        
        if getTotalTime(mid) <= limit { right = mid - 1 }
        else { left = mid + 1 }
    }
    
    return left
}
