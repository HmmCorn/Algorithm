/*

// 1차시도: 50분

import Foundation

func solution(_ n: Int, _ costs: [[Int]]) -> Int {

    // "가장 적은 비용으로 모두를 통행"
    //  - 간선 비용 정렬
    //  - 사이클이 안생기게 같은 그룹인지 확인하기
    //
    // 정렬된 간선을 순회하면서
    //  - 다른 그룹이면 연결하고, 간선 비용 더하기
    //  - 같은 그룹이면 패스
    //
    //  - 그럼 시작은: 그냥 정렬된 간선의 처음부터 시작
    //  - 그럼 끝은: 간선이 (노드 - 1)개가 되면 끝
    
    func findRoot(a: Int) -> Int {
        
    }

    func otherGroup(a: Int, b: Int) -> Bool {
        let rootA = findRoot(a)
        let rootB = findRoot(b)
        return rootA != rootB
    }

    func connect(a: Int, b: Int) {
        let rootA = findRoot(a)
        let rootB = findRoot(b)

        if rootA != rootB { /* b의 루트를 rootA로 */ }
            // 루트를 저장하는게 필요
    }

        
        
        
        
    var sortedCosts = costs.sorted { $0[2] < $1[2] }
    var result = 0
    var edgeCount = 0

    for edge in sortedCosts {
        let a = edge[0]
        let b = edge[1]
        let cost = edge[2]

        if otherGroup(a, b) {
            connect(a, b)
            result += cost
            edgeCount += 1
        }

        if edgeCount == n-1 {
            break
        }
    }

    return result
}

*/    
    

// 2차 시도
    
import Foundation

func solution(_ n: Int, _ costs: [[Int]]) -> Int {

    // "가장 적은 비용으로 모두를 통행"
    //  - 간선 비용 정렬
    //  - 사이클이 안생기게 같은 그룹인지 확인하기
    //
    // 정렬된 간선을 순회하면서
    //  - 다른 그룹이면 연결하고, 간선 비용 더하기
    //  - 같은 그룹이면 패스
    //
    //  - 그럼 시작은: 그냥 정렬된 간선의 처음부터 시작
    //  - 그럼 끝은: 간선이 (노드 - 1)개가 되면 끝
    
    var parent = Array(0..<n)
    
    func findRoot(_ a: Int) -> Int {
        if parent[a] == a { return a }

        parent[a] = findRoot(parent[a])
        return parent[a]
    }

    func otherGroup(_ a: Int, _ b: Int) -> Bool {
        let rootA = findRoot(a)
        let rootB = findRoot(b)
        return rootA != rootB
    }

    func connect(_ a: Int, _ b: Int) {
        let rootA = findRoot(a)
        let rootB = findRoot(b)

        if rootA != rootB { parent[rootB] = rootA }
    }

    var sortedCosts = costs.sorted { $0[2] < $1[2] }
    var result = 0
    var edgeCount = 0

    for edge in sortedCosts {
        let a = edge[0]
        let b = edge[1]
        let cost = edge[2]

        if otherGroup(a, b) {
            connect(a, b)
            result += cost
            edgeCount += 1
        }

        if edgeCount == n-1 {
            break
        }
    }

    return result
}
