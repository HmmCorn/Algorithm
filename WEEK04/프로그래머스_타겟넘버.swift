// 프로그래머스 - 타겟 넘버

import Foundation

func solution(_ numbers: [Int], _ target: Int) -> Int {
    var count: Int = 0

    func dfs(index: Int, result: Int) {
        if index == numbers.count {
            if target == result {
                count += 1
            }
            return
        }

        dfs(index: index + 1, result: result + numbers[index])
        dfs(index: index + 1, result: result - numbers[index])
    }

    dfs(index: 0, result: 0)
    return count
}
