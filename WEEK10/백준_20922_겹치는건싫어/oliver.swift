let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0]
let k = nk[1]
let nums = readLine()!.split(separator: " ").compactMap { Int($0) }

var count: [Int: Int] = [:]
var left = 0
var right = 0
var result = 0

while right < n {
    let num = nums[right]
    count[num, default: 0] += 1

    // 1차 생각: 실패
    // if count[num]! > k {
    //     count[nums[left]]! -= 1
    //     left += 1
    // } else {
    //     result = max(result, right - left + 1)
    //     right += 1
    // }

    while count[num]! > k {
        count[nums[left]]! -= 1
        left += 1
    }

    result = max(result, right - left + 1)
    right += 1
}

print(result)
