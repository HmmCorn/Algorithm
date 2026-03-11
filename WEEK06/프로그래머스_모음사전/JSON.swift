import Foundation

// 중복 순열 문제
// 시간 복잡도: O(N^5) <= 3725 (N: word.count <= 5)

func solution(_ word:String) -> Int {
    let alphabet = ["A", "E", "I", "O", "U"]
    var result = 0

    /// Parameters:
    /// - cur: 현재까지 쌓은 알파벳. (예: "A" -> "AA" -> "AAA" -> ... -> "UUUUU")
    /// Returns:
    /// - word와 cur가 같을 경우 true. 아닐경우 false
    func backtrack(_ cur: String) -> Bool {
        if cur == word {
            return true
        }
        if cur.count >= 5 {
            return false
        }

        for char in alphabet {
            result += 1

            let isFinish = backtrack(cur + char)
            if isFinish {
                return isFinish
            }
        }

        return false
    }

    backtrack("")

    return result
}
