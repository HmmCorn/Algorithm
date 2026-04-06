let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]

let nums = readLine()!.split(separator: " ").compactMap { Int($0) }

var leftPointer = 0
var rightPointer = 0
var sum = nums[0]
var result = 0

while true {
    if sum == m {
        result += 1
        sum -= nums[leftPointer]
        leftPointer += 1
        // if leftPointer >= n { break }
    } else if sum < m {
        rightPointer += 1
        if rightPointer >= n { break }
        sum += nums[rightPointer]
    } else {
        sum -= nums[leftPointer]
        leftPointer += 1
        // if leftPointer >= n { break }
    }
}

print(result)
