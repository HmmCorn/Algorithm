// 프로그래머스 - 입국 심사

import Foundation

func solution(_ n: Int, _ times: [Int]) -> Int {
    let times = times.sorted { $0 < $1 }
    var start = times[0], end = times[times.count - 1]*n
    
    while start <= end {
        let target = (start + end) / 2
        var peopleCount = 0
        
        times.forEach { peopleCount += target / $0 }
        
        if peopleCount < n { start = target + 1 }
        else { end = target - 1 }
    }
    
    return start
}
