// 프로그래머스 - 산 모양 타일링

import Foundation

func solution(_ n: Int, _ tops: [Int]) -> Int {
    var dp1 = [Int](repeating: 0, count: n+1)
    var dp2 = [Int](repeating: 1, count: n+1)
    
    for index in 1...n {
        dp1[index] = (dp1[index - 1] + dp2[index - 1]) % 10007
        if tops[index - 1] == 1 {
            dp2[index] = (dp1[index - 1] * 2 + dp2[index - 1] * 3) % 10007
        }
        else {
            dp2[index] = (dp1[index - 1] + dp2[index - 1] * 2) % 10007
        }
    }
    return (dp1[n] + dp2[n]) % 10007
}
