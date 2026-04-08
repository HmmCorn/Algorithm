let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let k = input[1]

let elements = readLine()!.split(separator: " ").compactMap { Int($0) }

var left = 0

var dictionary: [Int: Int] = [:]

var result = 0

for right in 0..<elements.count {
    let current = elements[right]
    dictionary[current, default: 0] += 1
    while dictionary[current]! > k {
        let leftValue = elements[left]
        dictionary[leftValue]! -= 1
        left += 1
    }

    result = max(result, right - left + 1)
}

print(result)
