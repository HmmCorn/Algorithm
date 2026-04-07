let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var nums: [Int] = []
for _ in 0..<n {
    nums.append(Int(readLine()!)!)
}
nums = nums.sorted()

var left = 0
var right = 0
var result = Int.max

while right < n {
    if left == right {
        right += 1
        continue
    }

    let diff = nums[right] - nums[left]

    if diff >= m {
        result = min(diff, result)
        left += 1
    } else {
        right += 1
    }
}

print(result)

/*
// 수 고르기 양끝포인터는 "구간의 모든 가능성"을 못보기 때문에 틀림
let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var nums: [Int] = []
for _ in 0..<n {
    nums.append(Int(readLine()!)!)
}
nums = nums.sorted()

var left = 0
var right = n-1
var result = Int.max

while left < right {
    let diff = nums[right] - nums[left]

    if diff >= m {
        result = min(diff, result)
        right -= 1
    } else {
        left += 1
    }
}

print(result)
*/
