let n = Int(readLine()!)!

var nums = Array(1...n)
var left = 0
var right = 0
var sum = nums[0]
var result = 0

while true {
    if sum == n {
        result += 1
        sum -= nums[left]
        left += 1
    } else if sum < n {
        right += 1
        if right >= n { break }
        sum += nums[right]
    } else {
        sum -= nums[left]
        left += 1
    }
}

print(result)
