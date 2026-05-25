// 프로그래머스 - 피보나치 수

func solution(_ n: Int) -> Int {
    var answer = 1
    var previous = 0
    
    for index in 2...n {
        let sum = (answer + previous) % 1234567
        previous = answer
        answer = sum
    }
    
    return answer
}
