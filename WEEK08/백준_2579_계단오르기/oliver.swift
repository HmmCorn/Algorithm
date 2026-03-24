let n = Int(readLine()!)!
var stairs = [0]
for _ in 0..<n {
    stairs.append(Int(readLine()!)!)
}

if n <= 1 {
    print(stairs[n])
} else {
    // dp[i]: i위치에서 최고점수
    var dp = Array(repeating: 0, count: n+1)

    dp[1] = stairs[1]
    dp[2] = stairs[2] + stairs[1]

    if n >= 3 {
        for i in 3...n {
            dp[i] = max(
                stairs[i] + dp[i-2],
                stairs[i] + stairs[i-1] + dp[i-3]
            )
        }
    }

    print(dp[n])
}
