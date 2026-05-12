import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    let orders = orders.map { $0.map { String($0) }.sorted() }
    var result = [String]()

    for c in course {
        var count = [[String]: Int]()
        var temp = [[String]]()
        var maxCount = 0

        for o in orders {
            let com = combination(c, o)

            for candidate in com {
                count[candidate, default: 0] += 1

                if count[candidate, default: 0] >= 2 && count[candidate, default: 0] > maxCount {
                    temp = [candidate]
                    maxCount = count[candidate, default: 0]
                } else if count[candidate, default: 0] == maxCount {
                    temp.append(candidate)
                }
            }
        }
        result += temp.map { $0.joined(separator: "") }
    }

    return result.sorted()
}


func combination(_ k: Int, _ order: [String]) -> [[String]] {
    var result = [[String]]()

    func bruteforce(_ start: Int, _ cur: [String]) {
        if cur.count == k {
            result.append(cur)
            return
        }

        for i in start..<order.count {
            bruteforce(i + 1, cur + [order[i]])
        }
    }

    bruteforce(0, [])

    return result
}
