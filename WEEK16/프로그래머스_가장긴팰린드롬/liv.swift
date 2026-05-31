// 프로그래머스 - 가장 긴 팰린드롬

import Foundation

func solution(_ s: String) -> Int {
    let chars = Array(s)
    let n = chars.count

    var dp = Array(repeating: Array(repeating: false, count: n), count: n)

    var answer = 1

    for i in 0..<n {
        dp[i][i] = true
    }

    if n >= 2 {
        for i in 0..<(n - 1) where chars[i] == chars[i + 1] {
            dp[i][i + 1] = true
            answer = 2
        }
    }

    if n >= 3 {
        for length in 3...n {
            for start in 0...(n - length) {
                let end = start + length - 1

                if chars[start] == chars[end] && dp[start + 1][end - 1] {
                    dp[start][end] = true
                    answer = length
                }
            }
        }
    }

    return answer
}
