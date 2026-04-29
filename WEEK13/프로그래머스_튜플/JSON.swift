import Foundation

func solution(_ s:String) -> [Int] {
    var result = [Int]()
    let sortedSubsets = parse(s)

    result.append(sortedSubsets[0].first!)

    for i in 0..<sortedSubsets.count - 1 {
        result.append(sortedSubsets[i + 1].subtracting(sortedSubsets[i]).first!)
    }

    return result
}

func parse(_ str: String) -> [Set<Int>] {
    var str = str.map { String($0) }
    str.removeFirst()
    str.removeLast()

    var subsets = [Set<Int>]()
    var subset = Set<Int>()
    var tempNum = ""
    var isInner = false

    for c in str {
        if c == "," {
            if isInner {
                subset.insert(Int(tempNum) ?? -1)
                tempNum = ""
            }
        }
        else if c == "{" {
            isInner = true
        }
        else if c == "}" {
            subset.insert(Int(tempNum) ?? -1)
            subsets.append(subset)
            subset = []
            tempNum = ""
            isInner = false
        }
        else {
            tempNum += c
        }
    }

    return subsets.sorted { $0.count < $1.count }
}
