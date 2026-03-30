import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lost = Set(lost)
    var reserve = Set(reserve)

    for r in reserve {
        if lost.contains(r) {
            lost.remove(r)
            reserve.remove(r)
        }
    }

    var result = n - lost.count

    for r in reserve.sorted() {
        for x in [r - 1, r + 1] {
            if lost.contains(x) {
                lost.remove(x)
                result += 1
                break
            }
        }
    }

    return result
}
