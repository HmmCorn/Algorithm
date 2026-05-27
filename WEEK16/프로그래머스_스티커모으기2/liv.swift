// 프로그래머스 - 스티커 모으기 (2)

import Foundation

func solution(_ sticker: [Int]) -> Int {
    var n = sticker.count

    if n == 1 { return sticker[0] }
    
    var firstDP = [Int](repeating: 0, count: n)
    var secondDP = [Int](repeating: 0, count: n)
    
    firstDP[0] = sticker[0]
    firstDP[1] = sticker[0]
    
    secondDP[0] = 0
    secondDP[1] = sticker[1]
    
    for index in 2..<n {
        firstDP[index] = max(firstDP[index - 1], firstDP[index - 2] + sticker[index])
        secondDP[index] = max(secondDP[index - 1], secondDP[index - 2] + sticker[index])
    }
    
    return max(firstDP[n - 2], secondDP[n - 1])
}
