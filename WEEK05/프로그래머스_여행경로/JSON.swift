import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var result = [String]()
    var adjList = [String: [(String, Int)]]() 
    var vis = Array(repeating: false, count: tickets.count)
    
    for (idx, ticket) in tickets.enumerated() {
        adjList[ticket[0], default: []].append((ticket[1], idx))
    }
    
    for (key, value) in adjList {
        adjList[key] = value.sorted { $0.0 < $1.0 }
    }
    
    func dfs(_ start: String, _ path: [String]) -> Bool {
        if path.count == tickets.count + 1 {
            result = path
            return true
        }
        
        for (des, idx) in adjList[start, default: []] where !vis[idx] {
            vis[idx] = true
            if dfs(des, path + [des]) {
                return true
            }
            vis[idx] = false
        }
        
        return false
    }
    
    dfs("ICN", ["ICN"])
    
    return result
}
