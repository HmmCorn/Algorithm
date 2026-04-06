let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
let x = Int(readLine()!)!

var left = 0
var right = n-1
var result = 0

while left < right {
    let sum = nums[left] + nums[right]
    
    if sum == x {
        result += 1
        left += 1
        right -= 1
    } else if sum < x {
        left += 1
    } else {
        right -= 1
    }
}

print(result)
