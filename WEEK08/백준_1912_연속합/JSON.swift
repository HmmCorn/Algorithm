/**
부분 문제: i 번째까지 연속합의 최대: (i - 1번째 연속합 + seq[i]) or 새출발
*/

let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").compactMap { Int($0) }

var table = [Int](repeating: 0, count: n)
table[0] = seq[0]
var result = seq[0]

for i in 1..<n {
    table[i] = max(table[i - 1] + seq[i], seq[i])
    result = max(result, table[i])
}

print(result)
