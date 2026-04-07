let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").compactMap { Int($0) }

var left = 0
var right = n-1
var result = [nums[left], nums[right]]

while left < right {
    let sum = nums[left] + nums[right]

    if abs(sum) < abs(result[0] + result[1]) {
        result = [nums[left], nums[right]]
    }

    if sum < 0 {
        left += 1
    } else if sum > 0 {
        right -= 1
    } else {
        break
    }
}

print(result[0], result[1])
