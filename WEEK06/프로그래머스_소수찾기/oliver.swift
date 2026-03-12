// O(n) -> 나중에 최적화
// func isPrime(_ num: Int) -> Bool {
//     if num < 2 { return false }
    
//     var divisiorCount = 0

//     for i in 1...num {
//         if num % i == 0 { divisiorCount += 1 }
//     }

//     return divisiorCount == 2
// }

func solution2(_ numbers: String) -> Int {
    let numbers = numbers.compactMap { $0.wholeNumberValue }
    var results: Set<Int> = []
    var visited = Array(repeating: false, count: numbers.count)

    func dfs(_ currentNum: Int) {

        if isPrime(currentNum) { results.insert(currentNum) }

        for i in 0..<numbers.count {
            guard !visited[i] else { continue }

            visited[i] = true
            dfs(currentNum * 10 + numbers[i])
            visited[i] = false
        }
    }

    dfs(0)

    return results.count
}

func isPrime(_ num: Int) -> Bool {
    if num < 2 { return false }
    if num <= 3 { return true }

    var i = 2
    while i * i <= num {
        if num % i == 0 { return false }
        i += 1
    }

    return true
}

func solution(_ numbers: String) -> Int {
    let numbers = numbers.map { String($0) }
    var results: Set<Int> = []
    var visited = Array(repeating: false, count: numbers.count)

    func dfs(_ currentString: String) {

        if let currentNum = Int(currentString) {
            results.insert(currentNum)
        }

        for i in 0..<numbers.count {
            guard !visited[i] else { continue }

            visited[i] = true
            dfs(currentString + numbers[i])
            visited[i] = false
        }
    }

    dfs("")

    // isPrime을 한번에 확인해도 좋을듯
    return results.filter { isPrime($0) }.count
}
