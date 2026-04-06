// 백준 - 2003 수들의 합 2

let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
let (count, target) = (line[0], line[1])

var start = 0
var end = 0
var currentSum = numbers[0]
var answer = 0

while start < count && end < count {
    if currentSum > target {
        currentSum -= numbers[start]
        start += 1
        continue
    }
    
    end += 1
    if currentSum == target { answer += 1 }
    if end < count { currentSum += numbers[end] }
}

print(answer)
