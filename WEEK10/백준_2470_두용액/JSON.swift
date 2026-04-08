import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var (l, r) = (0, n - 1)
var mixed = Int.max
var result = (0, 0)

while l < r {
    let sum = arr[l] + arr[r]

    if abs(sum) < mixed {
        mixed = abs(sum)
        result = (arr[l], arr[r])
    }

    if sum < 0 { l += 1 }
    else if sum > 0 { r -= 1 }
    else { break }
}

print(result.0, result.1)
