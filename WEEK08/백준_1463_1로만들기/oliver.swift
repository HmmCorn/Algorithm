let n = Int(readLine()!)!

var dp = Array(repeating: 0, count: n+1)

if n == 1 {
    print(0)
} else {
    for i in (2...n) {
        dp[i] = dp[i-1] + 1

        if i % 2 == 0 && i % 3 == 0 {
            dp[i] = min(dp[i], dp[i/2] + 1, dp[i/3] + 1)
        } else if i % 2 == 0 {
            dp[i] = min(dp[i], dp[i/2] + 1)
        } else if i % 3 == 0 {
            dp[i] = min(dp[i], dp[i/3] + 1)
        }
    }

    print(dp[n])
}

// 0 1 2 3 4 5 6 7 8 9 10
// 0 0 0 0 0 0 0 0 0 0 0
// 0 0 1
// 0 0 1 1
// 0 0 1 1 2
// 0 0 1 1 2 3
// 0 0 1 1 2 3 2
// 0 0 1 1 2 3 2 3
// 0 0 1 1 2 3 2 3 3
// 0 0 1 1 2 3 2 3 3 2
// 0 0 1 1 2 3 2 3 3 2 3
