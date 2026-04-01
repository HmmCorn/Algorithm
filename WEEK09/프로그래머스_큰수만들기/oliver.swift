import Foundation

func solution1(_ number: String, _ k: Int) -> String {
    // number <= 1_000_000 이니깐 n log n 까지?

    // 시간초과
    // i위치에 대하여, i+1부터 (k-1)개를 비교해보고
    // - 뒤에 더 큰 숫자가 있으면 i를 지움

    var k = k
    var numbers = Array(number)
    var removed = Array(repeating: false, count: numbers.count)

    for i in 0..<numbers.count {
        if k == 0 { break }
        if removed[i] { continue }

        // 뒤에 k개 탐색해서 더 큰값 찾기
        var count = 0
        var hasBigger = false
        
        for j in (i+1)..<numbers.count {
            guard !removed[j] else { continue }

            count += 1
            if numbers[j] > numbers[i] {
                hasBigger = true
                break
            }

            if count == k { break }
        }

        if hasBigger {
            removed[i] = true
            k -= 1
        }
    }

    // 뒤에서 제거
    if k > 0 {
        var i = numbers.count - 1
        while i >= 0 && k > 0 {
            if !removed[i] {
                removed[i] = true
                k -= 1
            }
            i -= 1
        }
    }

    // 결과
    var result = ""
    for i in 0..<numbers.count where !removed[i] {
        result.append(numbers[i])
    }

    return result
}



// 뒤를 보고 결정하지말고 앞을 기억했다가 지우기

func solution(_ number: String, _ k: Int) -> String {
    var k = k
    let numbers = Array(number)
    var result: [Character] = []

    for number in numbers {
        while k > 0 && !result.isEmpty && result.last! < number {
            result.removeLast()
            k -= 1
        }
        result.append(number)
    }

    if k > 0 {
        result.removeLast(k)
    }

    return String(result)
}
