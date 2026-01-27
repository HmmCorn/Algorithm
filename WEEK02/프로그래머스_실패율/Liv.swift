// 프로그래머스 - 실패율

import Foundation

func solution(_ N: Int, _ stages: [Int]) -> [Int] {
    var restStages: [Int] = stages
    var resultTuple: [(Int, Double)] = []
    
    for stage in 0..<N {
        let players: Int = restStages.count
        let count: Int = restStages.filter { $0 == stage + 1}.count
        restStages = restStages.filter { $0 > stage + 1}
        resultTuple.append((stage + 1, Double(count) / Double(players)))
    }
    
    let result = resultTuple.sorted {$0.1 > $1.1}.map { $0.0 }
    return result
}
