func solution(_ n: Int, _ sticker: [[Int]]) -> Int {
    guard n > 1 else { return max(sticker[0][0], sticker[1][0])}

    var dp = sticker
    dp[0][1] += sticker[1][0]
    dp[1][1] += sticker[0][0]

    for i in 2..<n {
        dp[0][i] += max(dp[1][i - 1], dp[1][i - 2])
        dp[1][i] += max(dp[0][i - 1], dp[0][i - 2])
    }

    return max(dp[0][n - 1], dp[1][n - 1])
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let sticker = [inputRow(), inputRow()]
    print(solution(n, sticker))
}

func inputRow() -> [Int] {
    readLine()!.split(separator: " ").compactMap { Int($0) }
}
