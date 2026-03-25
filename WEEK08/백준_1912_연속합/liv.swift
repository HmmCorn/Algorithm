// 백준 - 1912 연속합

let count = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
var dp = numbers

for index in 1..<count where dp[index - 1] > 0 {
    dp[index] += dp[index - 1]
}

print(dp.max()!)
