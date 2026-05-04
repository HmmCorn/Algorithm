import Foundation

/**
userID 순회
bannedID 순회
-> 같으면 candidate 추가

candidate: [[userID]]

candidate 완탐 -> 조합

*/
func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var result = 0
    let userIDs = user_id.map { $0.map { String($0) } }
    let bannedIDs = banned_id.map { $0.map { String($0) } }
    let candidates = findCandidates(userIDs, bannedIDs)

    var vis = Set<Set<[String]>>()

    func backtrack(_ k: Int, _ cur: Set<[String]>) {
        var cur = cur
        if k == candidates.count {
            vis.insert(cur)
            return
        }

        for candidate in candidates[k] where !cur.contains(candidate) {
            cur.insert(candidate)
            backtrack(k + 1, cur)
            cur.remove(candidate)
        }
    }

    backtrack(0, [])
    result = vis.count

    return result
}

func findCandidates(_ userIDs: [[String]], _ bannedIDs: [[String]]) -> [[[String]]] {
    var candidates = [[[String]]](repeating: [], count: bannedIDs.count)

    for userID in userIDs {
        for (banIdx, bannedID) in bannedIDs.enumerated() where userID.count == bannedID.count {
            var isBan = true
            for i in 0..<userID.count {
                if bannedID[i] != "*" && userID[i] != bannedID[i] {
                    isBan = false
                }
            }

            if isBan {
                candidates[banIdx].append(userID)
            }
        }
    }

    return candidates
}
