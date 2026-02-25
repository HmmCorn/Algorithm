import Foundation

func solution(_ N: Int, _ stages: [Int]) -> [Int] {
    // stages 순회하면서 딕셔너리 등록
    var count: [Int: Int] = [:]
    for stage in stages {
        count[stage, default: 0] += 1
    }

    // 1~N 실패율 계산
    var user = stages.count
    var failureRates: [Int: Double] = [:]

    for stage in 1...N {
        let failure = count[stage, default: 0]
        let rate = user > 0 ? Double(failure) / Double(user) : 0
        failureRates[stage] = rate
        user -= failure
    }

    // 실패율 내림차순, 키값 리턴
    return failureRates
    .sorted { if $0.value == $1.value { return $0.key < $1.key } return $0.value > $1.value }
    .map { $0.key }
}
