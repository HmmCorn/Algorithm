import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var result = 0
    guard words.contains(target) else { return result }
    
    let target = target.map { String($0) }
    var cur = begin.map { String($0) }
    var words = words.map { $0.map { String($0) } }
    
    var vis = Array(repeating: -1, count: words.count)
    var queue = [(cur, 0)]      // [(단어, 변환 횟수)]
    var queueIdx = 0
    
    while queueIdx < queue.count {
        let (cur, curCount) = queue[queueIdx]
        queueIdx += 1
        
        if cur == target {
            result = curCount
            break
        }
        
        for i in 0..<words.count {
            let next = words[i]
            guard vis[i] == -1 && canNext(cur, next) else { continue }
            queue.append((next, curCount + 1))
            vis[i] = curCount + 1
        }
    }
    
    return result
}


func canNext(_ before: [String], _ after: [String]) -> Bool {
    var diffCount = 0
    
    for i in 0..<before.count {
        guard diffCount <= 1 else { return false }
        
        if before[i] != after[i] {
            diffCount += 1
        }
    }

    return diffCount <= 1
}
