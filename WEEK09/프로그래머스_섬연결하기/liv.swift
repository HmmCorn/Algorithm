// 프로그래머스 - 섬 연결하기

import Foundation

func solution(_ n: Int, _ costs: [[Int]]) -> Int {
    var paths = costs.sorted { $0[2] < $1[2] }
    var result = 0
    
    var parent = [Int]()
    (0..<n).forEach { parent.append($0) }
    
    func find(from parent: inout [Int], _ node: Int) -> Int {
        if parent[node] == node { return node }
        
        parent[node] = find(from: &parent, parent[node])
        return parent[node]
    }
    
    func union(_ parent: inout [Int], _ a: Int, _ b: Int) {
        let parentOfA = find(from: &parent, a)
        let parentOfB = find(from: &parent, b)
        
        if parentOfA < parentOfB { parent[parentOfB] = parentOfA }
        else { parent[parentOfA] = parentOfB }
        
    }
    
    for path in paths {
        let a = path[0]
        let b = path[1]
        let cost = path[2]
        
        if find(from: &parent, a) != find(from: &parent, b) {
            union(&parent, a, b)
            result += cost
        }
    }
    
    return result
}
