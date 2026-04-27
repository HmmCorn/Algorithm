// 잘못된 풀이 -> 음수를 생각안함
// let n = Int(readLine()!)!
// let sortedNums = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

// func good(_ nums: [Int], target: Int) -> Bool {
//     var left = 0
//     var right = nums.count - 1
    
//     while left < right {
//         let sum = nums[left] + nums[right]    

//         if sum < target {
//             left += 1
//         } else if sum > target {
//             right -= 1
//         } else {
//             return true
//         }
//     }

//     return false
// }

// var result = 0
// for i in 2..<n {
//     let nums = Array(sortedNums[0..<i])

//     if good(nums, target: sortedNums[i]) {
//         result += 1
//     }
// }
// print(result)

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var result = 0

for targetIndex in 0..<n {
    var left = 0
    var right = n-1

    while left < right {
        if left == targetIndex {
            left += 1
            continue
        }

        if right == targetIndex {
            right -= 1
            continue
        }

        let sum = nums[left] + nums[right]
        let target = nums[targetIndex]

        if sum < target {
            left += 1
        } else if sum > target {
            right -= 1
        } else {
            result += 1
            break
        }
    }
}

print(result)
