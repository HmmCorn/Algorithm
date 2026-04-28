// 백준 - 35508 Good Bye, 토마토!

let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let (foodCount, limit) = (line[0], line[1])

var foods = [(time: Int, a: Int, b: Int)]()
for _ in 0..<foodCount {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    foods.append((line[0], line[1], line[2]))
}

foods.sort { $0.time < $1.time }

var maxB = [Int](repeating: 0, count:foodCount)
maxB[0] = foods[0].b

for i in 1..<foodCount { maxB[i] = max(foods[i].b, maxB[i-1]) }

var answer = 0

for a in 0..<foodCount {
    if foods[a].time <= limit {
        answer = max(answer, foods[a].a + foods[a].b)
    }
    
    let remain = limit - foods[a].time
    if remain < 0 { continue }

    var start = 0
    var end = foodCount - 1
    var index = -1

    while start <= end {
        let mid = (start + end) / 2

        if foods[mid].time <= remain {
            index = mid
            start = mid + 1
        }
        else { end = mid - 1 }
    }

    if index == -1 { continue }

    answer = max(answer, foods[a].a + maxB[index])
}

print(answer)
