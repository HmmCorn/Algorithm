import Foundation

func solution(_ begin: String, _ target: String, _ words: [String]) -> Int {
    if !words.contains(target) { return 0 }

    func dfs(_ word: String, _ currentCount: Int, _ words: [String]) -> Int {
        // 탈출 조건: target까지 변환했을 때
        if word == target {
            return currentCount
        }

        // 변환 조건: 현재 단어와 한 글자만 다른 것들
        let doable = words.filter { item in
            zip(word, item).filter { $0 != $1 }.count == 1
        }

        var min: Int = 51
        var nextList = words
        for next in doable {
            nextList.removeAll { $0 == next } // 더 나은 방법 없을까
            let result = dfs(next, currentCount + 1, nextList)
            min = min > result ? result : min
        }

        return min
    }
    
    return dfs(begin, 0, words)
}
