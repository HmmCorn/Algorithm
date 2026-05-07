import Foundation

func solution(_ relation:[[String]]) -> Int {
    let colCount = relation[0].count
    
    func getCombinations(_ arr: [Int]) -> [[Int]] {
        var result: [[Int]] = []
    
        func dfs(_ start: Int, _ current: [Int]) {
            if !current.isEmpty {
                result.append(current)
            }
            for i in start..<arr.count {
                dfs(i + 1, current + [arr[i]])
            }
        }
    
        dfs(0, [])
        return result
    }
    
    let combinations = getCombinations(Array(0..<colCount))
    var result: [[Int]] = []
    var resultSet: Set<[Int]> = []

    for combination in combinations {
        let keys = relation.map { row in combination.map { row[$0] }.joined(separator: "-") }
        
        if Set(keys).count == relation.count {
            // if result 최소성.. . . hmm
            // if resultSet/
            resultSet.map { $0.isContains(combination) }
            
            resultSet.insert(combination)
            result.append(combination)
        }
    }
    
    return result.count
}
