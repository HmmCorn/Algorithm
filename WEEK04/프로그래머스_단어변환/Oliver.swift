import Foundation

func solution(_ begin: String, _ target: String, _ words: [String]) -> Int {
    // 소문자만 있음
    // 3 <= 각단어 <= 10, 각단어 길이 모두 같음
    // 3<= words.count <= 50, words 중복없음
    // begin != target
    // 변환 불가능하면 0 리턴

    // O(n) (n <= 50)
    if !words.contains(target) { return 0 }

    return bfs(begin, target, words)
}

func bfs(_ begin: String, _ target: String, _ words: [String]) -> Int {
    var visited = Array(repeating: false, count: words.count)
    var queue: [(word: String, depth: Int)] = [(begin, 0)]

    while !queue.isEmpty {
        let (current, depth) = queue.removeFirst()

        if current == target { return depth }

        for i in 0..<words.count {
            if !visited[i] && isOneDiff(current, words[i]) {
                visited[i] = true
                queue.append((words[i], depth + 1))
            }
        }
    }

    return 0
}

func isOneDiff(_ a: String, _ b: String) -> Bool {
    // a랑 b길이 같음
    var result = false
    let arrayA = Array(a)
    let arrayB = Array(b)

    var diff = 0

    for i in 0..<arrayA.count {
        if arrayA[i] != arrayB[i] {
            diff += 1
        }
    }

    if diff == 1 { result = true }
    return result
}
