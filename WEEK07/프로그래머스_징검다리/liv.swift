// 프로그래머스 - 징검다리

import Foundation

func solution(_ distance: Int, _ rocks: [Int], _ n: Int) -> Int {
    var rocks = rocks.sorted()
    rocks.append(distance)
    
    var start = 1
    var end = 1000000000
    
    while start <= end {
        let min = (start + end) / 2
        
        var previous = 0
        var removeCount = 0
        for rock in rocks {
            if rock - previous < min {
                removeCount += 1
            } else {
                previous = rock
            }
        }
        
        if removeCount <= n {
            start = min + 1
        } else {
            end = min - 1
        }
    }
    
    return end
}
