let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
_ = readLine()
let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
var output = [String]()

nums.forEach { output.append(binarySearch($0) ? "1" : "0") }

print(output.joined(separator: "\n"))

func binarySearch(_ target: Int) -> Bool {
    var start = 0; var end = n - 1

    while start <= end {
        let mid = (start + end) / 2
        if arr[mid] == target { return true }
        else if arr[mid] < target { start = mid + 1 }
        else { end = mid - 1 }
    }

    return false
}