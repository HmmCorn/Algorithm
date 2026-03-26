func solution(_ stickers: [[Int]]) -> Int {
    let n = stickers[0].count

    if n == 1 { return max(stickers[0][0], stickers[1][0]) }
    
    // dp[row][i]: stickers[row][i]의 스티커를 선택했을 때 0~i열까지의 최대 점수
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: 2)

    dp[0][0] = stickers[0][0]
    dp[1][0] = stickers[1][0]
    dp[0][1] = stickers[1][0] + stickers[0][1]
    dp[1][1] = stickers[0][0] + stickers[1][1]

    for i in 2..<n {
        // dp[0][i] = dp[1][i-1] + stickers[0][i]
        // dp[1][i] = dp[0][i-1] + stickers[1][i]

        dp[0][i] = max(
            dp[1][i-1] + stickers[0][i],
            dp[1][i-2] + stickers[0][i]
        )
        dp[1][i] = max(
            dp[0][i-1] + stickers[1][i],
            dp[0][i-2] + stickers[1][i]
        )
    }

    return max(dp[0].max()!, dp[1].max()!)
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let _ = Int(readLine()!)!
    let row1 = readLine()!.split(separator: " ").compactMap { Int($0) }
    let row2 = readLine()!.split(separator: " ").compactMap { Int($0) }

    let stickers: [[Int]] = [
        row1,
        row2
    ]

    print(solution(stickers))
}
