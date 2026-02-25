// 프로그래머스 - 실패율

import Foundation

func solution(_ N: Int, _ stages: [Int]) -> [Int] {
    var people: [Int: Double] = [:]
    var reachedPlayerCount: Double = Double(stages.count)
    var resultTuple: [(Int, Double)] = []
    
    // 각 단계에 머물러 있는 인원 체크 -> 실패율 계산용
    for stage in stages {
        people[stage, default: 0] += 1
    }
    
    // 단계 순회
    for stage in 1...N {
        // 1. 머물러 있지 않다면 모두 통과한 것 -> 실패율 0 부여
        guard let rest = people[stage] else {
            resultTuple.append((stage, 0.0))
            continue
        }
        // 2. (머물러 있는 인원 / 도달 인원)을 통해 실패율 부여
        resultTuple.append((stage, Double(rest) / reachedPlayerCount))
        reachedPlayerCount -= rest
    }
    
    // 낮은 숫자의 단계부터 append 했기 때문에 sorted는 실패율만 비교
    let result = resultTuple.sorted {$0.1 > $1.1}.map { $0.0 }
    return result
}
