import Foundation

func solution(_ word: String) -> Int {
    let letters = ["A", "E", "I", "O", "U"]
    var currentOrder = 0
    var result = 0

    func dfs(_ current: String) {

        guard result == 0 else { return }

        if current == word {
            result = currentOrder
            return
        }

        if current.count < 5 {
            for letter in letters {
                currentOrder += 1
                dfs(current + letter)
            }
        }
    }

    dfs("")
    return result
}
