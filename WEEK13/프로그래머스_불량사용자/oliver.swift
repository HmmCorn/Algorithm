import Foundation

// 패턴 매핑
func mapping(_ user: String, _ banned: String) -> Bool {
    if user.count != banned.count { return false }

    let arrUser = Array(user)
    let arrBanned = Array(banned)

    for i in 0..<arrUser.count {
        if arrBanned[i] == "*" { continue }
        if arrUser[i] != arrBanned[i] { return false }
    }

    return true
}

func solution(_ user_id: [String], _ banned_id: [String]) -> Int {

    // candidates[i] 는 banned[i]에 들어갈 수 있는 user들
    var candidates: [[String]] = []

    for banned in banned_id {
        var list: [String] = []

        for user in user_id {
            if mapping(user, banned) {
                list.append(user)
            }
        }

        candidates.append(list)
    }

    // candidates[0]에서 1명
    // candidates[1]에서 1명
    // ...
    // 하나씩 선택해서 조합 만들기 (같은 user를 중복 선택하면 안됨) (순서 달라도 같은 조합)
    // 선택이 이어짐 -> 트리 구조 -> dfs?

    var combinations = Set<Set<String>>()

    func dfs(_ depth: Int, _ currentSelect: Set<String>) {
        // 경우 완성
        if depth == banned_id.count {
            combinations.insert(currentSelect)
            return
        }

        for user in candidates[depth] {
            // 이미 선택한 user는 제외
            if currentSelect.contains(user) { continue }

            var next = currentSelect
            next.insert(user)

            dfs(depth + 1, next)
        }
    }

    dfs(0, Set<String>())

    return combinations.count
}
