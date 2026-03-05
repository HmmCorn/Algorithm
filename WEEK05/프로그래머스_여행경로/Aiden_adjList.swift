import Foundation

func solution(_ tickets:[[String]]) -> [String] {    
    var visited = [Bool](repeating: false, count: tickets.count)
    var graph = [String: [(String, Int)]]()
    var result = [String]()
    
    for (idx, ticket) in tickets.enumerated() {
        graph[ticket[0], default: []].append((ticket[1], idx))
    }
    
    graph.keys.forEach { graph[$0]?.sort { $0.0 < $1.0 } }

    func dfs(_ start: String, _ path: [String]) -> Bool {
        if path.count == tickets.count + 1 {
            result = path
            return true
        }
        
        for (nextNode, nextIdx) in graph[start, default: []] where !visited[nextIdx] {
            visited[nextIdx] = true
            if dfs(nextNode, path + [nextNode]) { return true }
            visited[nextIdx] = false
        }

        return false
    }

    dfs("ICN", ["ICN"])
    
    return result
}
