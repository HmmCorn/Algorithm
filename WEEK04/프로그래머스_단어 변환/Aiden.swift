import Foundation

func isReplacable(_ base: String, _ target: String) -> Bool {
//     let base = Array(base)
//     let target = Array(target)
//     let count = base.count
//     var flag = 0
    
//     for i in 0..<count {
//         if base[i] != target[i] { flag += 1 }
//         if flag > 1 { return false }
//     }
    
//     return flag == 1 ? true : false
    
    return zip(base, target).filter { $0 != $1 }.count == 1
}

// 10 * 50 * 50
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    func bfs() -> Int {
        var queue = Queue()
        queue.enqueue((0, begin))
        var isVisited = [Bool](repeating: false, count: words.count)
        
        while !queue.isEmpty {
            let (curDepth, curWord) = queue.dequeue()
            
            if curWord == target { return curDepth }
            
            for (idx, word) in words.enumerated() {
                if !isVisited[idx] && isReplacable(curWord, word) {
                    queue.enqueue((curDepth + 1, word))
                    isVisited[idx] = true
                }
            }
        }
        
        return 0
    }
    
    let result = bfs()
    return result
}

struct Queue {
    typealias Element = (Int, String)
    var inputStack = [Element]()
    var outputStack = [Element]()
    var isEmpty: Bool { inputStack.isEmpty && outputStack.isEmpty }
    var count: Int { inputStack.count + outputStack.count }
    mutating func enqueue(_ element: Element) {
        inputStack.append(element)
    }
    mutating func dequeue() -> Element {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        return outputStack.removeLast()
    }
}