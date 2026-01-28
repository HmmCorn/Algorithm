import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var userStageMap: [Int: Double] = [:]
    var stageFailMap: [Int: Double] = [:]
    var userCount = Double(stages.count)
    
    // stages 순회 후 값 할당시 59ms 까지 상승 비할당시 38ms
    for stage in stages {
        userStageMap[stage, default: 0] += 1
    }

    for i in 1...N {
        if let stageUser = userStageMap[i] {
            stageFailMap[i] = stageUser / userCount
            userCount -= stageUser
        } else {
            stageFailMap[i] = 0
        }
    }
    
    let sortedStageMap = stageFailMap.sorted { lhs, rhs in
        if lhs.value == rhs.value {
            return lhs.key < rhs.key
        } else {
            return lhs.value > rhs.value
        }
    }

    return sortedStageMap.map { $0.key }
}
