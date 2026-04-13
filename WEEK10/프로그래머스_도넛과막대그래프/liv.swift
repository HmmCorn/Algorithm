// 프로그래머스 - 도넛과 막대 그래프

import Foundation

func solution(_ edges: [[Int]]) -> [Int] {
    var donut = 0; var stick = 0; var eight = 0
    var answer = 0
    
    var count = 0
    edges.forEach { count = max(count, max($0[0], $0[1])) }
    
    var inTable = [Int](repeating: 0, count: count + 1)
    var outTable = [Set<Int>](repeating: [], count: count + 1)
    edges.forEach { edge in
        outTable[edge[0]].insert(edge[1])
        inTable[edge[1]] += 1
    }

    var startItems = Set<Int>()
    for (number, targets) in outTable.enumerated() 
    where targets.count >= 2 && inTable[number] == 0 {
        answer = number
        startItems = outTable[answer]
        break
    }
    
    for item in startItems {
        var visited = Set<Int>()
        var current = item
        
        while true {
            if visited.contains(current) { donut += 1; break }
            
            let nextItems = outTable[current]
            visited.insert(current)
            
            if nextItems.isEmpty { stick += 1; break }
            
            if nextItems.count == 2 { eight += 1; break }
            
            current = nextItems.first!
        }
    }
    
    return [answer, donut, stick, eight]
}
