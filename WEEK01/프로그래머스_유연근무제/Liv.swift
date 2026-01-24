// 프로그래머스 - 유연근무제

import Foundation

func solution(_ schedules: [Int], _ timelogs: [[Int]], _ startday: Int) -> Int {
    var result: Int = 0
    let count: Int = schedules.count
    var person = 0
    
    for goal in schedules {
        var pass: Int = 0
        var day: Int = startday
        let passTime = (goal + 10) % 100 <= 59 ? goal + 10 : goal + 50
        
        for log in timelogs[person] {
            if log <= passTime && day < 6 {
                pass += 1
            }
            day = (day == 7) ? 1 : (day + 1)
        }
        
        if pass == 5 {
            result += 1
        }
        
        person += 1
    }
    
    return result
}
