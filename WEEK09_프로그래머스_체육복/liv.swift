// 프로그래머스 - 체육복

import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    let lostSet = Set(lost)
    let reserveSet = Set(reserve)
    var students = [Int](repeating: -1, count: n+1)
    var answer = 0
    
    for number in 1...n {
        var count = 1
        if lostSet.contains(number) { count -= 1 }
        if reserveSet.contains(number) { count += 1 }
        students[number] = count
        answer += count > 0 ? 1 : 0
    }
    
    for index in students.indices where students[index] == 0 {
        for peer in [index - 1, index + 1] where peer <= n && students[peer] > 1 {
            students[index] += 1
            students[peer] -= 1
            answer += 1
            break
        }
    }
    
    return answer
}
