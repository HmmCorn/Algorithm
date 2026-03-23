import Foundation

// 첫 시도
//func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
//    let rocks = rocks.sorted()
//
//    func getDistance() -> [Int] {
//        var result = [rocks[0]]
//
//        for i in 0..<rocks.count - 1 {
//            let diff = rocks[i + 1] - rocks[i]
//            result.append(diff)
//        }
//        result.append(distance - rocks[rocks.count - 1])
//        return result
//    }
//
//
//    let diff = getDistance()
//    var (l, r) = (0, distance)
//    // print(">>> diff: ", diff)
//
//    while l <= r {
//        let mid = (l + r) / 2
//
//        let count = diff.filter { $0 >= mid }.count
//        // print(l, r, mid, count)
//        if count >= n {
//            l = mid + 1
//        } else {
//            r = mid - 1
//        }
//    }
//
//    return r
//}


func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    let rocks = rocks.sorted() + [distance]
    var (l, r) = (0, distance)

    while l <= r {
        let mid = (l + r) / 2       // 각 바위 사이의 최소 거리

        var (prev, removedCount) = (0, 0)

        for rock in rocks {
            if rock - prev < mid {
                removedCount += 1
            } else {
                prev = rock
            }
        }

        if removedCount <= n {
            l = mid + 1
        } else {
            r = mid - 1
        }
    }

    return r
}
