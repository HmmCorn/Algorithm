// O(2^20) ~= 10^6 완탐 가능

// MARK: - BFS
import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    
    func bfs() {
        var queue = Queue()
        queue.enqueue((0, 0))
        
        while !queue.isEmpty {
            let (currentNode, currentDepth) = queue.dequeue()
            if currentDepth == numbers.count {
                if currentNode == target { result += 1 }
                continue
            }
            
            queue.enqueue((currentNode + numbers[currentDepth], currentDepth + 1))
            queue.enqueue((currentNode - numbers[currentDepth], currentDepth + 1))
        }
    }
    
    bfs()
    
    return result
}

struct Queue {
    typealias Element = (Int, Int)
    
    var inputStack = [Element]()
    var outputStack = [Element]()
    
    var isEmpty: Bool { inputStack.isEmpty && outputStack.isEmpty }
    var count: Int { inputStack.count + outputStack.count }
    
    init(_ elements: [Element] = []) {
        outputStack = elements.reversed()
    }
    
    mutating func enqueue(_ element: Element) {
        inputStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element {
        if outputStack.isEmpty { 
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        return outputStack.removeLast()
    }
}

// MARK: - DFS
import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    
    func dfs() {
        var stack = [(Int, Int)]()
        stack.append((0, 0))
        
        while !stack.isEmpty {
            let (currentNode, currentDepth) = stack.removeLast()

            if currentDepth == numbers.count {
                if currentNode == target { result += 1 }
                continue
            }
            
            stack.append((currentNode + numbers[currentDepth], currentDepth + 1))
            stack.append((currentNode - numbers[currentDepth], currentDepth + 1))
        }
    }
    
    dfs()
    
    return result
}

