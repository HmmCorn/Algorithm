// struct Queue<T> {
//     private var enqueueStack: [T] = []
//     private var dequeueStack: [T] = []

//     var isEmpty: Bool { return enqueueStack.isEmpty && dequeueStack.isEmpty }

//     mutating func enqueue(_ element: T) {
//         enqueueStack.append(element)
//     }

//     mutating func dequeue() -> T? {
//         if dequeueStack.isEmpty {
//             dequeueStack = enqueueStack.reversed()
//             enqueueStack.removeAll()
//         }
//         return dequeueStack.popLast()
//     }
// }

// let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
// let endNum = inputs[0]
// let length = inputs[1]
// var originQueue = Queue<Int>()

// for i in 1...endNum {
//     originQueue.enqueue(i)
// }

// func dfs(_ list: [Int]) {
//     if list.count == length {
//         print(list.map { String($0) }.joined(separator: " "))
//         return
//     }

//     var queue = originQueue

//     while !queue.isEmpty {
//         var list = list
//         let current = queue.dequeue()!
//         guard !list.contains(current) else { continue }
//         list.append(current)
//         dfs(list)
//     }
// }

// dfs([])

let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let endNum = inputs[0]
let numList = (1...endNum).map { Int($0) }
let length = inputs[1]
var visited: [Bool] = Array(repeating: false, count: endNum)

func dfs(_ list: [Int]) {
    if list.count == length {
        print(list.map { String($0) }.joined(separator: " "))
        return
    }

    for i in 0..<endNum where !visited[i] {
        visited[i] = true
        dfs(list + [numList[i]])
        visited[i] = false
    }
}

dfs([])


