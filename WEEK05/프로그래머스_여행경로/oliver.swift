import Foundation

func solution(_ tickets: [[String]]) -> [String] {
    // 정렬된 인접 리스트 만들기 (node: [edge])
    var graph: [String: [String]] = [:]
    for ticket in tickets {
        graph[ticket[0], default: []].append(ticket[1])
    }
    for key in graph.keys {
        graph[key]?.sort()
    }

    // dfs
    let edgeCount = tickets.count
    var path: [String] = []

    func dfs(currentNode: String) -> Bool {
        path.append(currentNode)

        // 모든 edge 사용
        if path.count == edgeCount + 1 { return true }

        guard let edges = graph[currentNode] else { 
            path.removeLast()
            return false 
        }
        for index in 0..<edges.count {
            let nextNode = edges[index]

            graph[currentNode]!.remove(at: index)

            if dfs(currentNode: nextNode) { return true }

            // 백트래킹
            graph[currentNode]!.insert(nextNode, at: index)
        }

        path.removeLast()
        return false
    }

    dfs(currentNode: "ICN")
    return path
}

/*
[["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]
[
    "INC": ["HND", "JFK"],
    "HND": ["IAD"],
    "JFK": ["HND"]
]
*/
