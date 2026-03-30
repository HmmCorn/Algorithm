import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    
    // (lost 교집합 reserve)을 제거
    let originalLost = lost
    let originalReserve = reserve
    var lost = originalLost.filter { !originalReserve.contains($0) }.sorted()
    var reserve = originalReserve.filter { !originalLost.contains($0) }.sorted()

    // "항상 앞번호 학생에게 먼저 빌리기"
    for i in 0..<lost.count {
        for j in 0..<reserve.count {

            if reserve[j] == lost[i] - 1 {
                reserve.remove(at: j)
                lost[i] = -1
                break
            }

            else if reserve[j] == lost[i] + 1 {
                reserve.remove(at: j)
                lost[i] = -1
                break
            }
        }
    }

    let haveNot = lost.filter { $0 != -1 }.count
    return n - haveNot
}
