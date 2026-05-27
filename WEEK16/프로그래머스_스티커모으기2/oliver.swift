import Foundation

func solution(_ sticker: [Int]) -> Int{
    let n = sticker.count

    if n == 1 { return sticker[0] }
    if n == 2 { return max(sticker[0], sticker[1]) }
    if n == 3 { return max(sticker[0], sticker[1], sticker[2]) }

    let first = linear(sticker, start: 0, end: n-2)
    let notFirst = linear(sticker, start: 1, end: n-1)

    return max(first, notFirst)
}

func linear(_ sticker: [Int], start: Int, end: Int) -> Int {

    var memo = Array(repeating: 0, count: sticker.count)
    memo[start] = sticker[start]
    memo[start+1] = max(sticker[start], sticker[start+1])

    for i in (start + 2)...end {
        memo[i] = max(memo[i-1], memo[i-2] + sticker[i])
    }

    return memo[end]
}
