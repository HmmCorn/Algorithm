// 백준 - 20922 겹치는 건 싫어

let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
let (totalCount, limit) = (line[0], line[1])

var start = 0
var end = 0
var count = 0
var dict = [Int:Int]()

var answer = 0

while end < totalCount {
    let currentNumber = numbers[end]
    dict[currentNumber, default: 0] += 1
    count += 1
    
    while dict[currentNumber]! > limit {
        dict[numbers[start]]! -= 1
        start += 1
        count -= 1
    }
    
    answer = max(answer, count)
    end += 1
}

print(answer)
