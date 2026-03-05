// 백준 - 1389 케빈 베이컨의 6단계 법칙

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let peopleCount = firstLine[0]
let pairCount = firstLine[1]
var list: [Set<Int>] = Array(repeating: Set<Int>(), count: peopleCount + 1)

/*
0 : []
1 : [3, 4]
2 : [3]
3 : [1, 4, 2]
4 : [3, 1, 5]
5 : [4]
*/

for _ in 0..<pairCount {
    let pairLine = readLine()!.split(separator: " ").map { Int($0)! }
    list[pairLine[0]].insert(pairLine[1])
    list[pairLine[1]].insert(pairLine[0])
}

var selected: Int = 0
var min: Int = peopleCount * peopleCount

for person in 1...peopleCount {
    var keven: Int = 0
    for target in 1...peopleCount where target != person {
        let result = bfs(target, person)
        keven += result
    }

    if keven < min {
        min = keven
        selected = person
    }
}

print(selected)

func bfs(_ target: Int, _ start: Int) -> Int {
    var queue: [(Int, Int)] = [(start, 0)]
    var head: Int = 0
    var visited: [Bool] = Array(repeating: false, count: peopleCount + 1)
    visited[start] = true

    while queue.count > head {
        let (current, depth) = queue[head]
        head += 1

        if current == target {
            return depth
        }

        let nextList = list[current]
        for next in nextList where !visited[next] {
            visited[next] = true
            queue.append((next, depth + 1))
        }
    }
    return 0
}
