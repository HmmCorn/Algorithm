// 프로그래머스 - 실패율

import Foundation


func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var totalPlayer = stages.count
    var playerByStages = [Int: Int]()
    var failRates = [Int: Double]()

    for stage in stages {
        playerByStages[stage, default: 0] += 1
    }

    for stage in 1...N {
        let failRate = Double(playerByStages[stage, default: 0]) / Double(totalPlayer)
        failRates[stage] = failRate
        totalPlayer -= playerByStages[stage, default: 0]
    }

    return failRates
    .sorted { $0.key < $1.key }
    .sorted { $0.value > $1.value}
    .map { $0.key }
}
