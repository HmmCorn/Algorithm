// 프로그래머스 - 유연근무제

import Foundation

func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    var result = 0

    for employee in 0..<schedules.count {
        let limit = toMinute(from: schedules[employee]) + 10
        var isSuccess = true

        for j in 0..<7 {
            let time = toMinute(from: timelogs[employee][j])
            guard !isHoliday(at: startday + j) else {  continue  }
            guard time <= limit else {
                isSuccess = false
                break
            }
        }
        result += isSuccess ? 1 : 0
    }

    return result
}

func toMinute(from time: Int) -> Int {
    let hour = time / 100
    let minute = time % 100
    return hour * 60 + minute
}

func isHoliday(at num: Int) -> Bool {
    let dow = (num) % 7
    return dow == 6 || dow == 0
}
