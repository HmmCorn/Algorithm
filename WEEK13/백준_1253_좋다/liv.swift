// 백준 - 1253 좋다

let count = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").compactMap( { Int($0) }).sorted()

var result = 0

for i in 0..<count {
    let target = numbers[i]
    var left = 0
    var right = count - 1
    
    while left < right {
        if left == i { left += 1; continue }
        if right == i { right -= 1; continue }
        
        let sum = numbers[left] + numbers[right]
        
        if sum == target { result += 1; break }
        else if sum > target { right -= 1 }
        else { left += 1 }
    }
}

print(result)
