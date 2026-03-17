import Foundation

// 첫 풀이

// func solution(_ n:Int, _ times:[Int]) -> Int64 {
//     let maxDuration = n * times.max()!

//     var l = 0
//     var r = maxDuration

//     while l <= r {
//         let mid = (l + r) / 2
//         let passedPeople = times.reduce(0) { $0 + mid / $1 }

//         if passedPeople >= n {
//             r = mid - 1
//         } else {
//             l = mid + 1
//         }
//     }

//     return Int64(l)
// }



// times 순회 최적화

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let maxDuration = n * times.max()!

    var l = 0
    var r = maxDuration

    while l <= r {
        let mid = (l + r) / 2
        var passedPeople = 0

        for time in times {
            passedPeople += mid / time

            if passedPeople >= n {
                break
            }
        }

        if passedPeople >= n {
            r = mid - 1
        } else {
            l = mid + 1
        }
    }

    return Int64(l)
}
