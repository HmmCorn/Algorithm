import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var graph = [Int: Set<Int>]()
    var visited = [Bool](repeating: false, count: n)
    var result = 0
    
    for (nodeA, computer) in computers.enumerated() {
        for nodeB in 0..<computer.count {
            if computer[nodeB] == 0 { continue }
            graph[nodeA, default: []].insert(nodeB)
            graph[nodeB, default: []].insert(nodeA)
        }
    }
    
    func dfs(_ start: Int) {
        visited[start] = true
        
        for nextNode in graph[start, default: []] where !visited[nextNode] {
            dfs(nextNode)
        }
    }
    
    for node in 0..<n where !visited[node] {
        dfs(node)
        result += 1
    }
    
    return result
}
