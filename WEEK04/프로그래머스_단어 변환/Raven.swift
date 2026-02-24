import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }
    
    func isReplaceable(_ target: String, _ word: String) -> Bool {
        return zip(target, word).filter { $0 != $1 }.count == 1
    }
    
    // var currentWord: [String] = begin.map { String($0) }
    // var words: [[String]] = words.map { $0.map { String($0) }}
    // var target: [String] = target.map { String($0) }
    // var result: Int = words.count
    
    // func dfs(_ currentWord: [String], _ count: Int) {
    //     var currentWord = currentWord
    //     if currentWord == target || result < count {
    //         result = min(count, result)
    //     } else {
    //         let words = words.filter { isReplaceable(currentWord, $0) }
    //         for word in words {
    //             dfs(word, count + 1)
    //         }
    //     }
    // }
    

    // dfs(currentWord, 0)
    // return result
    
    // var queue: [String] = []
    var visited = Set<String>()
    var queue: [(word: String, count: Int)] = [(begin, 0)]
    visited.insert(begin)
    
    while !queue.isEmpty {
        let (current, count) = queue.removeFirst()
        
        if current == target { return count }
        
        for word in words {
            if !visited.contains(word) && isReplaceable(word, current) {
                visited.insert(word)
                queue.append((word, count + 1))
            }
        }
    }
    return 0
}
