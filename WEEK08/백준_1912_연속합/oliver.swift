let n = Int(readLine()!)! // 1 ~ 100,000
let nums = [0] + readLine()!.split(separator: " ").compactMap { Int($0) }

// dp[i] = i번째 위치에서 최대합
var dp = Array(repeating: 0, count: n+1)
dp[1] = nums[1]

if n >= 2 {
    for i in 2...n {
        dp[i] = max(
            nums[i],
            dp[i-1] + nums[i]
        )
    }
}

dp = Array(dp[1...n])
print(dp.max()!)
