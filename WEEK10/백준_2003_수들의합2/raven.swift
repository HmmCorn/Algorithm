let input = readLine()!.split(separator: " ")
let n = Int(input[0])!
let m = Int(input[1])!
let elements = readLine()!.split(separator: " ").compactMap { Int($0) }

var current = 0
var result = 0
var left = 0

for right in 0..<n {
    current += elements[right]
    
    while current > m {
        current -= elements[left]
        left += 1
    }
    
    if current == m { result += 1 }
}

print(result)
