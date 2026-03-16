// nums에서 targets[0~m]이 있는지 찾기
// n, m <= 100,000
let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").compactMap { Int($0) }

// O(M * N) -> 시간초과
// for target in targets {
//     if nums.contains(target) { print("1") }
//     else { print("0") }
// }

nums.sort()

for target in targets {
    var startIndex = 0
    var endIndex = n-1
    var midIndex = n/2
    var hasNum = false

    while startIndex <= endIndex {
        if nums[midIndex] == target {
            hasNum = true
            break
        } else if nums[midIndex] < target {
            startIndex = midIndex + 1
            midIndex = (startIndex + endIndex) / 2
        } else {
            endIndex = midIndex - 1
            midIndex = (startIndex + endIndex) / 2
        }
    }

    print(hasNum ? "1" : "0")
}
