// 프로그래머스 - 땅따먹기

import Foundation

func solution(_ land: [[Int]]) -> Int {
    let n = land.count
    var dp = land
    
    for row in 1..<n {
        for col in 0..<4 {
            var previous = dp[row - 1]
            previous[col] = 0
            dp[row][col] += previous.max()!
        }
    }
    
    return dp[n - 1].max()!
}
