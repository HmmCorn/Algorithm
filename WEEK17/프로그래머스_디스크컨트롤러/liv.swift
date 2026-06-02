// 프로그래머스 - 디스크 컨트롤러

import Foundation

func solution(_ jobs: [[Int]]) -> Int {
    var n = jobs.count
    var jobs = jobs.sorted { $0[0] < $1[0] }
    
    var time = 0
    var count = 0
    var index = 0
    var queue = Heap<[Int]>(priorityFunction: { $0[1] < $1[1] })
    
    var answer = 0
    
    while count < n {
        // 아직 요청하지 않은 jobs에서 현재 time보다 요청 시점이 같거나 작은 작업을 queue에 삽입
        // queue에 작업이 있으면 그 작업 수행 (= time에 해당 작업의 소요 시간 더하고, count += 1, queue에서 제거)
        // queue에 작업이 없으면 time += 1
        
        while index < jobs.count && jobs[index][0] <= time {
            queue.enqueue(jobs[index])
            index += 1
        }
        
        if let job = queue.dequeue() {
            time += job[1]
            answer += time - job[0]
            count += 1
        } else {
            time += 1
        }
    }
    
    return answer / n
}

struct Heap<T> {
    var elements: [T]
    let priority: (T, T) -> Bool
    
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    func peek() -> T? { elements.first }
    
    func isRoot(_ index: Int) -> Bool { index == 0 }
    func leftChildIndex(of index: Int) -> Int { (2 * index) + 1 }
    func rightChildIndex(of index: Int) -> Int { (2 * index) + 2 }
    func parentIndex(of index: Int) -> Int { (index - 1) / 2 }
    
    init(elements: [T] = [], priorityFunction: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priority = priorityFunction
        
        for index in stride(from: elements.count / 2 - 1, through: 0, by: -1){
            siftDown(index: index)
        }
    }
    
    func highestPriorityIndex(of parent: Int, and child: Int) -> Int {
        guard child < count
            && priority(elements[child], elements[parent])
        else { return parent }
        return child
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at first: Int, with second: Int) {
        guard first != second else { return }
        elements.swapAt(first, second)
    }
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
        siftUp(index: count - 1)
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty { siftDown(index: 0) }
        
        return element
    }
    
    mutating func siftUp(index: Int) {
        let parent = parentIndex(of: index)
        
        guard !isRoot(index) 
            && priority(elements[index], elements[parent])
        else { return }
        
        swapElement(at: index, with: parent)
        siftUp(index: parent)
    }
    
    mutating func siftDown(index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex { return }
        
        swapElement(at: index, with: childIndex)
        siftDown(index: childIndex)
    }
}
