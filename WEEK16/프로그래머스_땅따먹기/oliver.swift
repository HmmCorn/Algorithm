import Foundation

func solution(_ land: [[Int]]) -> Int {

    let rowCount = land.count
    let colCount = 4

    var memo = land

    for i in 1..<rowCount {
        for j in 0..<colCount {
            // 현재 열(j) 제외하고 이전 행(i-1)의 값들 중 최대값

            if j == 0 {
                memo[i][0] += max(memo[i-1][1], memo[i-1][2], memo[i-1][3])
            } else if j == 1 {
                memo[i][1] += max(memo[i-1][0], memo[i-1][2], memo[i-1][3])
            } else if j == 2 {
                memo[i][2] += max(memo[i-1][0], memo[i-1][1], memo[i-1][3])
            } else if j == 3 {
                memo[i][3] += max(memo[i-1][0], memo[i-1][1], memo[i-1][2])
            }
        }
    }

    return memo[rowCount - 1].max()!
}
