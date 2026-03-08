import Foundation

func solution(_ tickets: [[String]]) -> [String] {
    var rm: [String: [String]] = [:]
    
    for ticket in tickets {
        rm[ticket[0], default: []].append(ticket[1])
    }
    
    for key in rm.keys {
        rm[key]?.sort()
    }
    
    var result: [String] = []
    
    func dfs(_ start: String, _ path: [String], _ rm: [String: [String]]) {
        guard result.isEmpty else { return }
        var path = path
        path.append(start)
        
        if path.count == tickets.count + 1 {
            result = path
            return
        }
        
        guard let nexts = rm[start] else { return }

        for (index, next) in nexts.enumerated() {
            var rm = rm
            rm[start]?.remove(at: index)
            dfs(next, path, rm)
        }
    }
    dfs("ICN", [], rm)
    return result
}
