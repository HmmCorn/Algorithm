import Foundation

func solution(_ tickets:[[String]]) -> [String] {    
    var visited = [String: Bool]()
    var graph = [String: [String]]()
    
    for ticket in tickets {
        
    }

    func dfs(_ start: String, _ path: [String]) -> Bool {
        if path.count == sortedTickets.count + 1 {
            result = path
            return true
        }

        for i in 0..<sortedTickets.count {
            guard !visited[i], sortedTickets[i][0] == start else { continue }
            visited[i] = true
            if dfs(sortedTickets[i][1], path + [sortedTickets[i][1]]) {
                return true
            }
            visited[i] = false
        }
        return false
    }

    dfs("ICN", ["ICN"])
    
    return result
}
