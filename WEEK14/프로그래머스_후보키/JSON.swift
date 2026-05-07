import Foundation

func solution(_ relation:[[String]]) -> Int {
    let arr = (0..<relation[0].count).map { $0 }
    let colIndices = getSubsets(arr)
    var result = 0
    var candidates = [Set<Int>]()

    for colIndex in colIndices {
        if isUniqueKey(colIndex, relation) && isMinimal(colIndex, candidates) {
            result += 1
            candidates.append(colIndex)
        }
    }

    return result
}

func isMinimal(_ colIdx: Set<Int>, _ candidates: [Set<Int>]) -> Bool {
    candidates.allSatisfy { !$0.isSubset(of: colIdx) }
}

func isUniqueKey(_ colIdx: Set<Int>, _ relation: [[String]]) -> Bool {
    var rows = Set<String>()

    for i in 0..<relation.count {
        var row = ""
        for j in colIdx {
            row += relation[i][j]
        }
        rows.insert(row)
    }

    return rows.count == relation.count
}

func getSubsets(_ arr: [Int]) -> [Set<Int>] {
    var result = [Set<Int>]()

    func bruteforce(_ k: Int, _ start: Int, _ cur: Set<Int>) {
        if cur.count == k {
            result.append(cur)
            return
        }

        var cur = cur

        for i in start..<arr.count {
            cur.insert(arr[i])
            bruteforce(k, i + 1, cur)
            cur.remove(arr[i])
        }
    }

    for k in 1...arr.count {
        bruteforce(k, 0, [])
    }

    return result
}


